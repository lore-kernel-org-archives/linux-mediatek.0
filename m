Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06487C4451C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 10:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDdpB6ZYwZIlR+moMdqHy53xNfFlVy927sGzMiz2qu8=; b=utfH//1oy71WPSl/feLzCZInUb
	noK4YK/0v6S/aRpHi/BP4UdUAjNtOvUpWY9xd1XcRyqCvc5YWDc2csfg+yBPMvBhzFo4dUV+FB0P2
	IXRUnvVukVQ6UlLfsW9pH0rApIOfYWtpP57WD9fHyngHFqu95zhCgLG2LA88LHlH7Cph81TcKoHbn
	Fd4a0vGaHVb+wu3Xi/YHk8A+djIHHGc37E4BfL6sYRvuIESAo2QYIs6wUEzsxdHVxrEc790vUvT70
	D5uNc+xQ+N9dQ/0vFUOPZhLqjtCXJQqchyilj+XM2/R9gM6yhH9UmRtvA94vOwzqcWB6cS0xPT0RB
	zW2oUEHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7JP-000000093At-2yUd;
	Tue, 21 Jul 2026 10:02:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7JN-000000093AG-1A68
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 10:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784628172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FDdpB6ZYwZIlR+moMdqHy53xNfFlVy927sGzMiz2qu8=;
	b=Fy40yyLXiSyK8FdCLzP7qSELmxhKlTKj5BvhDpUH7wQFdYskwzXfxJyLnAYDOoj6+rclzN
	m1OvxA9fFUDx6oJz/YEJsW6CM+RiO33r3p39sGkWs0nTALkRMfn4/rsoQggKMrVmtiM982
	YDWO74QLE0cqHk7JZF0q9fqsSsas6J4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641--too-ZfbNmatSNPBHkF_Nw-1; Tue, 21 Jul 2026 06:02:50 -0400
X-MC-Unique: -too-ZfbNmatSNPBHkF_Nw-1
X-Mimecast-MFC-AGG-ID: -too-ZfbNmatSNPBHkF_Nw_1784628169
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47f7039fa59so1997028f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 03:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628169; x=1785232969;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FDdpB6ZYwZIlR+moMdqHy53xNfFlVy927sGzMiz2qu8=;
        b=Fth9TUGBuZXj/AcEFbpLZ+Ti/HqTvwWyJi/ypjIHpNx8ZxHdaFO4fMMGqZf02VCcMm
         Ybv4dRT8C5XFfwuvb0JStcPt4/+3qaLeDE9MN/Q1hISg0xoKkWrgv8/sNT1P9efZvL1+
         aXRaKkRq16oLvboiZz6PXA3dO7gYs1frbJFnRr4E3PbDY7be3gggVqP1ZsFQhNHdtC0O
         ApQg2Cr1dbrl6M2GAX8Z3WJl+kkTd9xGa/iXFmSajG9dlc4aEye49uWtyHbH7sOmws7c
         e1HHpYerV65ac/z80zagrQJ9h/EbY7NrMLasGaSybogEr6spCrS8GZr2i3ejdmW6jeGT
         g8tA==
X-Forwarded-Encrypted: i=1; AHgh+RqDDC1WOuY5f4A9VqgJCkjdHB2VHRqnnPnP0q6fLn406THP/96XyRxdqX5yOApAiYSHQ3LOwPI/POFyIz8meg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzBFduAbt9TyY5jYr5Ud+eLppVDeksWhwWCY1vhp8zE6Mo9FVe
	3zTsGiHCsj/Uo2AUg3RHpNlMXHs/Y3B40xRlQ6bXGh3y3mtfoO/tn+BainVT0nr/B36vpfXAGj0
	Qlko76M2JHi0DUF8KAc+VcuXd/skq1iRsxFtoBLAeEkRAF16Qlf3iMZsD8G91hA2e60boBT7TCg
	==
X-Gm-Gg: AR+sD11/+utCr1DoeFRoUoRsFfHhRtpv/IIDPtMPYOvQ7NUrdk2eBRvwq/uiViQXaNQ
	7lNGpUPQb72EHUP+1F5ZTGkAIM0WImCDpl17RhiHjvemChTAB0LPSiBgWenDOfEXp274fsn+Vha
	YGo/tXNxNwWR3fHt8GHGRddqbaRH1JOfG51fFRg+6D3Zl79wjC5cO6/xDPs4UepA2KCP/6ctmA1
	yXaEuPnC1qF4Jmtoe8lD4+n9l+SRie0fTTCzIab+x7HRam7iikkR+/ByK08B+MKwqLIRMCr6uVB
	jE+H22IDgcbqAwb+7VdCebBmJYE1hjDLY/dx3SJYSzHA6MOBhP/tvVl3/VKcBwyE5eTCYIfQWb1
	vTGsr3Jj72+dUcv2HizgNId53b/KZHivw9rOEURM8KhtfsNckQoy8rgXCOUQv9WQfiruzQNw5A3
	ouAQ==
X-Received: by 2002:a5d:5848:0:b0:47f:71a6:79c5 with SMTP id ffacd0b85a97d-47f71a67a5amr12529381f8f.12.1784628169117;
        Tue, 21 Jul 2026 03:02:49 -0700 (PDT)
X-Received: by 2002:a5d:5848:0:b0:47f:71a6:79c5 with SMTP id ffacd0b85a97d-47f71a67a5amr12529309f8f.12.1784628168390;
        Tue, 21 Jul 2026 03:02:48 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d? ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49ce4sm38099290f8f.8.2026.07.21.03.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 03:02:47 -0700 (PDT)
Message-ID: <7e12f83c-2449-4618-bf43-acc533df3a36@redhat.com>
Date: Tue, 21 Jul 2026 12:02:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/5] net: phy: mediatek: add calibration logic
 for AN7581
To: Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260708102341.53919-1-ansuelsmth@gmail.com>
 <20260708102341.53919-5-ansuelsmth@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260708102341.53919-5-ansuelsmth@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p5wfuuqcw6b8ErgDb-jl3H5neEmRuJu-bih39Jt-lZ4_1784628169
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_030253_416459_CF5DF38E 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
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

On 7/8/26 12:23 PM, Christian Marangi wrote:
> +static int airoha_cal_cycle(struct phy_device *phydev, int devad,
> +			    u32 regnum, u16 mask, u16 cal_val)
> +{
> +	struct airoha_socphy_shared *shared = phy_package_get_priv(phydev);
> +	struct phy_device *phydev_p0;
> +	int ret;
> +
> +	phydev_p0 = shared->phydev_p0;
> +
> +	phy_modify_mmd(phydev, devad, regnum, mask, cal_val);
> +
> +	ret = mtk_cal_cycle_wait(phydev_p0);

The above call causes a builder error at link time in allmodyes config:

ERROR: modpost: "mtk_cal_cycle_wait"
[drivers/net/phy/mediatek/airoha-ge-soc.ko] undefined!

Also sashiko gemini has a few points:

https://sashiko.dev/#/patchset/20260708102341.53919-1-ansuelsmth%40gmail.com

/P


