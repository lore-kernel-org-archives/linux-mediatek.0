Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1164ECD611D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 18:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4YLGGXbrrLjvb4zCyI7F1AlXVbYIpxU4ak6ei/Asfk=; b=FpXAiMSSFpKudvOo2wsnuYZ6GT
	w3aJamdZxYhSLi74xfQT+TIl/+lpnbbp3Uf3rGngjuGW3q3QWlsHtpK1/195zPeXa+iU2hBE8zkAL
	s261xO2VBsPBFnnVw1oBtVf9o5G5bibsK7U4rDE7+6IbTLKUk4JNBEDMmMMOnkqBToG06Isj8zHGq
	pXOMDfSgXsMX+7259XiU5AdUzOnyyUb/9DbFvi9c2glR4G4HUxJaDUDsnm801xVW+2OOB6ncALNtz
	LIP6g0xNP2yQxsFTdGcZFPQ7y0dOZ4+dQaEu3r3XXkB3SgHSfQL+oZx18NjXQxZxPqmX/ezhXNQy4
	JTyfZgGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpv23-00BOM1-2s;
	Mon, 09 Oct 2023 18:31:07 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpv21-00BOLM-02
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Oct 2023 18:31:06 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c434c33ec0so28659875ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Oct 2023 11:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696876264; x=1697481064; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b4YLGGXbrrLjvb4zCyI7F1AlXVbYIpxU4ak6ei/Asfk=;
        b=UQtF6RbHsTpQg+PExPvkScy8yP+yKrq3TGPEzRVM2TjzhpGp+kBSNtMc8vdJQcpZAT
         +IBaUKRV+zIx15RDiRy/Ud/Ne6kllINMLuRnh9UJgm1i/DSACHPTX9xSzXhLeJC/atUQ
         GHrzgOW6bTi4zYwVhGRK737D7sUkplamXUbiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696876264; x=1697481064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4YLGGXbrrLjvb4zCyI7F1AlXVbYIpxU4ak6ei/Asfk=;
        b=KAfWsRw7E5cHK+hrlLR+USW2pgESFY0FQtaL0HG3+peYTfMmSRuHOegwaFRVnMbQG1
         f7/IKcCdSr2j0XmiG4UGG9DSooo4AeyviuOV+ZrTa5S2LmL6eNAkgRCI5SsCHVezkaWC
         dlhlXIk6G9dcmRkRgsQoQHhY807ZJv0W3oj9Vk9klG22iCXiztMtzTBoKDI4l4PnC2Z+
         Uu3gy5NIxsZJiRkQDtvA54lIzvgfLp8Se1MGHUg2ELxybe5EV+Eg3MA8k+OSXi8p0Z9q
         hc9UVkmpdL7VqoAraDk6EgwCTnMAhcaD8mbZW6N9N+ID3M+JYdeyU3pUR1nvfDzfH3pr
         X0kA==
X-Gm-Message-State: AOJu0Yx6Cqb3G9otT8JVKNMe1OloWwscTwwGIMQYgcN6kfB4mmU9ndN4
	MfguiMlMN/0KPkGHf2mOu+9DvQ==
X-Google-Smtp-Source: AGHT+IEfZLu+q8z77f8yTs57x1Oc7X+rrXlwq2+A/E6WLeAqCfE6BHI+9FeLGHL6pUrvjkTjs5bmFA==
X-Received: by 2002:a17:902:7084:b0:1b6:649b:92cc with SMTP id z4-20020a170902708400b001b6649b92ccmr11607238plk.69.1696876263974;
        Mon, 09 Oct 2023 11:31:03 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a21-20020a170902ee9500b001c5fc291ef9sm184216pld.209.2023.10.09.11.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 11:31:03 -0700 (PDT)
Date: Mon, 9 Oct 2023 11:31:00 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] net: dsa: mt7530: replace deprecated strncpy with
 ethtool_sprintf
Message-ID: <202310091130.D951BA0A6@keescook>
References: <20231009-strncpy-drivers-net-dsa-mt7530-c-v1-1-ec6677a6436a@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009-strncpy-drivers-net-dsa-mt7530-c-v1-1-ec6677a6436a@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_113105_055030_07FFA0BA 
X-CRM114-Status: GOOD (  10.06  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Oct 09, 2023 at 06:29:19PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings
> [1] and as such we should prefer more robust and less ambiguous string
> interfaces.
> 
> ethtool_sprintf() is designed specifically for get_strings() usage.
> Let's replace strncpy in favor of this more robust and easier to
> understand interface.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Looks correct to me.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

