Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54943C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 16:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KuoTEViI0d+tG3qkWmkuPyOog6TPSyu8gF8qmKb0cF0=; b=PP4mXvu/oecmNg
	D0k3dhNzQUDhkAfBIM78/GmzRgE186Xn9KvCRpkfCRhj5dKYXnMMJJOVOfYU0g9t464+gLPHKEXkL
	swlhoQ6paOGB5+iFMsWdA8v0877voxSN1W3NSo43ijZvjfHla6OIztAWBQ0cnqUobuqUZGSsvS80B
	Wqj7+r7kA3CI1OP7VGLUN8b3DfbnNIoKY+i6PErDe3zbS6J+FcyREAIJKgA4H613cHiE+yMChk/E/
	89HMqiP1QieEcAAj52rU2psHYa7qlhp21LysJmebTQTDYBz+5/ReiCPegKiA8MRzjVTQ+yoiy8vZv
	lnPUlhBHx9iXExPvGOXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n82de-006TGq-Hq; Thu, 13 Jan 2022 16:07:46 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n82dR-006TET-Nk; Thu, 13 Jan 2022 16:07:35 +0000
Received: by mail-wr1-x436.google.com with SMTP id k18so10954950wrg.11;
 Thu, 13 Jan 2022 08:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PwSeFv9GB4Ge8brnKE8VTFo9qC32x3isiJuiciOy0+g=;
 b=bGvpTJ0coW2ogYsySYSLmXRaVlo4krdScJuayYqdI8bJJxI6EDMQNEN/86qFdwVPTM
 LJvpWMbyl+QIcHoyT4ZYHOG9k/oVxOUnAX0/HUcWKETUxXEQ0UHmZQrckmxduwWCgwUY
 msT9t1UHr8yWZ54u2lt/zcShA0/Rz2k3UlG9wLH1jgpNX88Q31Trny6nKixoJucF+TIQ
 Sp94V1z6ls89wI4FYTKtNWnZbIHOXtGt3M4j0+HM+gQABK5zk/IeGBGPEi/6fYZ7R1mB
 o9S6jMT24mhFsSYg4vsUQkB3qW5uFcRL6+tbK5EZmPQ3tRrtlCDMSosiBPmSBsf/Dbd6
 XoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PwSeFv9GB4Ge8brnKE8VTFo9qC32x3isiJuiciOy0+g=;
 b=fK+lh3JeeP6K8wCSSLTOVRtYhmN33R5zV7aSxxhti+rKoPSc1iZMfQHoiYkdVnrP5P
 iZAblwR4AbKshj6LUG8tKJhDR/eGluy0gc+BDukcAtDSkLlw3AtDacX9I4GaesgA1Iay
 wqIA1jdBybuJaJKYzCBPjbQ4H0Av80croTyuemuaCrYa8Ig2CwFW621Lz19gcEmAxO6V
 ugSEfCR6p6XO++ICMxqpvnIXKX1nx26T7cmvk4f5WGrDTFhbhchXsxk6t/YYd/3MK7T7
 1GTG5u+KqiDPpPz3x7Pt12DVjMDP7dsgTWk8V1FUdCB4mLNnwjX7cg+l1wfjGXQgYf0u
 tZng==
X-Gm-Message-State: AOAM53152ACCFWJo20M+0LRRUTE26Wzfm48HdOoRCLHmVyUSxdnqPfUZ
 /5yJLt6Guj6zST3hBQzGL6M=
X-Google-Smtp-Source: ABdhPJzky7QYTuWWb3OI01G2wOYM6MMzIoWxm0AABm8ROBu/qSEU/Sr7Ja8mkDYAZySUN9+WRMqvYw==
X-Received: by 2002:a5d:5848:: with SMTP id i8mr4580577wrf.398.1642090051785; 
 Thu, 13 Jan 2022 08:07:31 -0800 (PST)
Received: from [192.168.0.18] (81.172.62.207.dyn.user.ono.com. [81.172.62.207])
 by smtp.gmail.com with ESMTPSA id c11sm9214288wmq.48.2022.01.13.08.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 08:07:30 -0800 (PST)
Message-ID: <9d82a86a-74ea-3d2a-2d7a-64fc45042974@gmail.com>
Date: Thu, 13 Jan 2022 17:07:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 0/5] Update MT8192 Clock Setting
Content-Language: en-US
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, nfraprado@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 chun-jie.chen@mediatek.com, devicetree@vger.kernel.org,
 drinkcat@chromium.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, Chen-Yu Tsai <wenst@chromium.org>,
 Ryder Lee <ryder.lee@kernel.org>
References: <20220113065822.11809-1-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220113065822.11809-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_080734_538635_62829F7F 
X-CRM114-Status: GOOD (  10.60  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 13/01/2022 07:58, allen-kh.cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> This patch is base on v5.16-rc8,
> 
> changes since v3:
>   - update that list(remove already upstream patch)
> 
> changes since v2:
>   - add missing "clock" at the end of commit message
> 
> changes since v1:
>   - update the commit message
> 
> Allen-KH Cheng (5):
>    arm64: dts: mediatek: Correct uart clock of MT8192
>    arm64: dts: mediatek: Correct SPI clock of MT8192
>    arm64: dts: mediatek: Correct Nor Flash clock of MT8192
>    arm64: dts: mediatek: Correct I2C clock of MT8192
>    arm64: dts: mediatek: Correct system timer clock of MT8192
> 

Whole series queued in v5.17-tmp/dts64 which will be renamed to v5.17-next/dts64 
as soon as v5.17-rc1 is released.

Thanks!
Matthias

>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 92 +++++++++++++-----------
>   1 file changed, 52 insertions(+), 40 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
