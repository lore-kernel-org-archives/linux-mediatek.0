Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE68C7EE23
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 14:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6R/AFNwzrtunbmWPmDv87Cn95GOIDO7jB8qZhOttiKM=; b=KA1kfvVLFn0eJA9GIiW1dGjBx+
	XpdA1xEQFEmeXLgQ+V07zQAEU2fU8EU/kYNpBRAEYRry1APyjWIXjpxKV3LtJPwrLeeGht/BvQNZt
	Ovin6I93YKU//B0mFXfcyWDkiTnNBeqI4lJXHKRfUZvNeEhtAT1oAF+rDqjAe7agsZNYEvJ2V9xj0
	U3BD69md9KgnBp/bIXVC07jBLA2BWVj/0wsO9d/nBv6i5lzxuW192b1JuL5GHNoVwLcdjq5BjlYEM
	pQeRswC0E+s9KgAVO9DLKJ3Vs/lkO3FwrVFLTC91qJwM6VPeFD91PBuH+Gu7GdNnWei+Bhxcs9BAx
	vFMRZRcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1pcQ-00Dhaa-04;
	Wed, 24 May 2023 14:37:38 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1pcL-00DhX9-0D;
	Wed, 24 May 2023 14:37:36 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-510dabb39aeso1985870a12.2;
        Wed, 24 May 2023 07:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684939049; x=1687531049;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6R/AFNwzrtunbmWPmDv87Cn95GOIDO7jB8qZhOttiKM=;
        b=GKdPZas6hWGMwdFH0maeBI+Kwjsi7y4aVQENQCq51fCfUjKVZWOwDGyPz3Si4t3Mpu
         dRUG3ROl5JV4sNnTQX46GJUngPc7q0iiohkcmIaCPeHAWPRq5LsyfRjd3GUQbyEor/GT
         cIn4nFnG/PFfaOgSZliVKZKWyzyNzz58yEr9Nk0PuYABKMILNHsxSVFjkiKaHn38qJLn
         z9cdSIeUfDdNe4yj6wcdDAOIwrMmvjfVzO0HCytMb8dZt0jbyvEqDTKE02TtTYqJm8Mo
         5Wcq07vuVX6fUJ3AL2HbIBQWOHrtftPGeOslgijIba9h4nVVv4pjoiwpQcAaILUxUf3p
         sPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684939049; x=1687531049;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6R/AFNwzrtunbmWPmDv87Cn95GOIDO7jB8qZhOttiKM=;
        b=fsJ/9nKnRWQgsaHJv/yBUo5IEBpCbC2b+duBKHwfAjJItBLV00bP+U972l2jzeYwGJ
         8pDjOY3pwHqZyumpb4fA5E4CNlvvCCY4R2+ZMT2VC2Belwbqag9zRhKOYTdrxsRLjyD/
         MRkDDFT64j9tgc491tBcqzq5VGyYWy4habvwJN8nT06dfpNPauU+xgcvT3ipjzYVQb0y
         yQJOp4iQJgR1Ts13oQrPazukObNvfhmB1SU89LFWgo6GLypItLdkNEnzUGKbtUYqmang
         Dqr3IPmIExeMQQIAQ8qu+uwaQGsoNv0nSl4dq57d8zg/Jyn4oO6ixWP9/wWzEKShb4OB
         Tmhg==
X-Gm-Message-State: AC+VfDx0MrWZum0iuIaiAJ9SS7SuLqJg7w/IhGvQ4DsWl7q9I8WOS8//
	u5RfSeDrRj5emF7Xc+Jpvws=
X-Google-Smtp-Source: ACHHUZ6yOZ6KHUg2ii58wBarDl3I1nVAtSUMNdc3+YLGMASBlJhftnDAAHQZMt3bPQD+mZD6VXnWOg==
X-Received: by 2002:a17:907:16aa:b0:971:484:6391 with SMTP id hc42-20020a17090716aa00b0097104846391mr6362990ejc.20.1684939048339;
        Wed, 24 May 2023 07:37:28 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id a17-20020a17090680d100b0094f7744d135sm5804744ejx.78.2023.05.24.07.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 07:37:27 -0700 (PDT)
Date: Wed, 24 May 2023 17:37:25 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 30/30] MAINTAINERS: add me as maintainer of
 MEDIATEK SWITCH DRIVER
Message-ID: <20230524143725.dupxs3t2a3ovogon@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-31-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-31-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_073733_107392_A1B6F2F2 
X-CRM114-Status: GOOD (  10.34  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 22, 2023 at 03:15:32PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Add me as a maintainer of the MediaTek MT7530 DSA subdriver.
> 
> List maintainers in alphabetical order by first name.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Patches on the MAINTAINERS file go to the "net" tree, because people
working on stable branches of the kernel (which you also maintain) need
to "see" you as well, to be able to ask you questions.

