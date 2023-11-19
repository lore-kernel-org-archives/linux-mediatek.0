Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F27C54E76
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Nov 2023 14:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZI6+aQ9+c+bpfwBYIcSU777SeZBaK2MLQMxaHGRpFI=; b=PXCnHf6oGWLubuniO2ouOKjBuH
	JAiN0TkP/wwS/gKXMCAFVpqmIp9Hmy6wLZ36iEgs2uFk16ni8t6pbOUihDzT5D7bL7TAdGzugSXKs
	uDNbLNfwuRg6YoUKqVZdYRfa2s2UtsoaS4SqACpElsZUuyE6RYPuZenH7MP9IhsdyoT6vaRBBSWbU
	nOXBKiIB0i1/NRAh2bMKHcwhRVG2apj2h2C9xg5tm3vHPesbAgQuZ6nCvmQUBBQ2iHfmCY+jBedFN
	x3uLVhy0cRwQVCn45trDCbyJwHBLAWT2S5nEPzyfdfJdRF9JdwFnkUPMJ1ozwOkJGCS9mazqt7/Sx
	7E8VujDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4iyf-00AIPg-0X;
	Sun, 19 Nov 2023 14:40:49 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4iyb-00AIP9-2g;
	Sun, 19 Nov 2023 14:40:47 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c878e228b4so8891561fa.1;
        Sun, 19 Nov 2023 06:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700404842; x=1701009642; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ZI6+aQ9+c+bpfwBYIcSU777SeZBaK2MLQMxaHGRpFI=;
        b=YUgzixegfSThgKJIKuRiFSDMT+fqN/h0UUEewrLYjaKNuUuGYhcv9Xr9KAiUKF0AGI
         Rmt+fgZsaXAkYYhOImP+JcnCiZV13YnyO7KkO5Wn7nVRGuV2h+i0INJo5iQyYqAmpCLB
         4rQsZ/aXyAYgF+rdE0mdED3zOQD1v4LhDty4QPZBmf6CFf9NyjTJNKG6YDu/BtjZZJTD
         25lWxfax72gqIVrFi+zCsWrb4HTUaLXbJGbEV2+APQh4XRC42XpiN5opwWPffmFUAOEf
         fWtbn0LzD3Lqog1hkoHRrWtLh+iRTs4umBa9kbFzAPjGKymI6V6UhiNb2MgfIAAspG45
         +a0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700404842; x=1701009642;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZI6+aQ9+c+bpfwBYIcSU777SeZBaK2MLQMxaHGRpFI=;
        b=Te/guQq0DQWyprfyLdOjMBblv+ee10nsvN6VrsJ5OnY2Lnk6TEg+tXox6qb6l/Mee0
         zjRvVpGxHETvOywvCOpxKKhalOFR1EY2KJHbsfrHebbj2nJbXy4PBSZ2fOFKIWfBlV8N
         jMU+1LrQAcHkczgeDOC3pl9rz72Jp2ng0T/Ymm8MNJRlBbemMHqm9HwQT1gR4gqQ+8QE
         Q8zIfxnaZnKa9sZo+eNSZ7RzrP0EylA1TI7nwf6Sp8RDctwtWVQw8S0321ZngwEzjJ47
         +Ye+pXFgE+foIID+KHMUKep5OUGbDf2Ujjvift2I9tWMd8g3RQtC6V0uRglNap0CDEZc
         pAaA==
X-Gm-Message-State: AOJu0YxuR+/9lGS+a37saaq3JPmn8QbqEt09SdTEMJt+GU2KtEwgOgVX
	h5cI/5r8CeKTpLw530sBL44=
X-Google-Smtp-Source: AGHT+IGz3Am6v44VUwMqk25WU74XtddrbbJsFHcdTLt3huXceX43GKRCbBwubtG0I1e4Th/6uBbTrg==
X-Received: by 2002:a2e:2245:0:b0:2c8:713c:b506 with SMTP id i66-20020a2e2245000000b002c8713cb506mr3263978lji.43.1700404842251;
        Sun, 19 Nov 2023 06:40:42 -0800 (PST)
Received: from skbuf ([188.26.185.114])
        by smtp.gmail.com with ESMTPSA id a3-20020a05600c348300b0040a5e69482esm14598744wmq.11.2023.11.19.06.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 06:40:42 -0800 (PST)
Date: Sun, 19 Nov 2023 16:40:39 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 02/15] net: dsa: mt7530: use p5_interface_select
 as data type for p5_intf_sel
Message-ID: <20231119144039.gvbima26zhktf6bd@skbuf>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
 <20231118123205.266819-3-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231118123205.266819-3-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_064045_896693_2737A27C 
X-CRM114-Status: GOOD (  10.68  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Russell King <linux@armlinux.org.uk>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Nov 18, 2023 at 03:31:52PM +0300, Arınç ÜNAL wrote:
> Use the p5_interface_select enumeration as the data type for the
> p5_intf_sel field. This ensures p5_intf_sel can only take the values
> defined in the p5_interface_select enumeration.
> 
> Remove the explicit assignment of 0 to P5_DISABLED as the first enum item
> is automatically assigned 0.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

