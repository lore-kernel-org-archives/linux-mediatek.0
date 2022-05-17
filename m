Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BA3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 11:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ejvjyCk87Y2QJe1yVSRKja+ZCvryNz8ws6zqfoJBdY=; b=wx1/lsrA+X7aV9
	LVu7vgbg5dcFptReUlRbV/v8ekIRSoM+Hm6ucT31r6zTsTQE2bWxOsbOPzw1TuugEoN7Ex96GmgQI
	SU3FJdSTWUNAXX6v4NnGIFUBWPoI1VbvKZeJD1WyBE6320BuLdQzt4VF7/7wBU+oyZDa5UiPzglu5
	v600Hqba0lpsx2pbrt3b3+z2CM5Kv01lp9QW6f5d2qEh2DBWQBV14+tnuV+9jGl1wp7hVLqyTYNJI
	6kGZcpXWXq55Dqcd/bNmsxi61dyHkRz35v2RM6ykieVb07Ltd8XE36jNmsps7IE6pGce+0lwrgRS7
	9Ya31Vxv3ZttlSLzVGCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqv5z-00DIle-JE; Tue, 17 May 2022 11:10:31 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqv5f-00DIZK-0H; Tue, 17 May 2022 11:10:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id AB0C91F43AE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652785809;
 bh=qf8uzbZ1EqZKktmG/w8A35nbIzmMTkGNdHNjUDAKrE0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YSEpN29NXtz9y0X68InodlahgVwMXAbQqp76hpOV6ZqVaCMcmQ604Hsdc+EMgGSWp
 iHP21VfOdjsMU1q4z3olc5ksKIpVDuSNx5b9aEEkn+xSaDc1zsEJl8U+RYi2zn9jpe
 byljfm3THQOEyYqu66vH85Ci4JOmATN1oJW7XYCJHYhoshg/JkrBjoXEyLcWFdkxXX
 5dR6aWBFVpXtDo80jDCg5oYpCI1Er0M31yjCljsEj17+xl84lwResrSPnngcH1cR3f
 HaQGPDaasbSn3GpwwWP6Tsl/H+vf1lvUEF2O2fuHLT+AHtofAujWeTA5b7lMIk/kOh
 DIboZigcnu4hQ==
Message-ID: <0ab46d63-3b3a-c847-df21-40efbeb01486@collabora.com>
Date: Tue, 17 May 2022 13:10:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/2] dt-bindings: mediatek: Add bindings for MT6795 M4U
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: martin.botka@somainline.org, linux-mediatek@lists.infradead.org,
 robh+dt@kernel.org, konrad.dybcio@somainline.org,
 paul.bouchara@somainline.org, krzysztof.kozlowski+dt@linaro.org,
 will@kernel.org, linux-kernel@vger.kernel.org, yong.wu@mediatek.com,
 ~postmarketos/upstreaming@lists.sr.ht, joro@8bytes.org,
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
 marijn.suijten@somainline.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, iommu@lists.linux-foundation.org
References: <20220513151411.395744-1-angelogioacchino.delregno@collabora.com>
 <20220513151411.395744-2-angelogioacchino.delregno@collabora.com>
 <20220516160307.GA2732645-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220516160307.GA2732645-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_041011_268416_6412C0F3 
X-CRM114-Status: GOOD (  14.00  )
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

Il 16/05/22 18:03, Rob Herring ha scritto:
> On Fri, 13 May 2022 17:14:10 +0200, AngeloGioacchino Del Regno wrote:
>> Add bindings for the MediaTek Helio X10 (MT6795) IOMMU/M4U.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../bindings/iommu/mediatek,iommu.yaml        |  3 +
>>   include/dt-bindings/memory/mt6795-larb-port.h | 96 +++++++++++++++++++
>>   2 files changed, 99 insertions(+)
>>   create mode 100644 include/dt-bindings/memory/mt6795-larb-port.h
>>
> 
> Acked-by: Rob Herring <robh@kernel.org>


Hello Rob,

I'm sad to say that, but I have to send a new version of this patch even though
you have acked it already... and I will have to drop your ack, as the changes to
the yaml patch will be a bit different, as we're adding support for a phandle
to mediatek,infracfg after some discussion about it on patch 2/2 of this series.

The mediatek,infracfg phandle addition will come as a different series, and this
patch (on v2) will add a conditional for:

   - if:

       properties:

         compatible:

           contains:

             enum:

               - mediatek,mt6795-m4u

     then:

       required:

         - mediatek,infracfg

Sorry about wasting your time on this v1.

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
