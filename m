Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D8F7C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 10:23:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BA652075B
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 10:23:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MOnixBZf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmQIllJ3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BA652075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rCpGYnjHXBagakqz+xwshVVajzgIpxvaQ1piYRp0Ybg=; b=MOnixBZfk/66sr+TKu4GAsZAz
	EOpLYGU8osEgCPSqs0lr1TtGxGaK7bqy/pxkz0IEQQc0UwYK1cWQXwbC4eRKp90yYx8yQb39V/ZK/
	URwVi4EUkj1MY2ZAWN4sJO9xiZOHNuaZSXf/ZSbLFVl7C//L4igwtpI9xVa3oqPCa7aDG/OcXm+D+
	lKprMFJ8l0Rr/lirD3XAf4mWBiow9ysoYotXGp+8u472cl41wRY8HFbWRjlZytPlKQiArVzzT5lUe
	OF3c//UZQUrt62a7OguHh/4v+oDLt5sJQxFtVNLnkNp4m8SglR0QM++iZPD1efbj+0f2FnOy8A7ga
	9jRvli5Kg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBF3p-0006IM-8r; Thu, 27 Aug 2020 10:23:13 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBF3n-0006Hw-La
 for linux-mediatek@lists.infradead.org; Thu, 27 Aug 2020 10:23:12 +0000
Received: by mail-wm1-x343.google.com with SMTP id s13so4657339wmh.4
 for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2020 03:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zSpMJELFSrYc8zHtKHbtKdtP/qKMyKq7CRfuycoBJuc=;
 b=mmQIllJ3TIVOxngFQAjmyon/FmWNIjtrOkvuCZETlEuUwN7/DokWUW1HP8vxeqWNCC
 8lS0u6EjhsIlb31rV9QOWhSz5nq65Kj7zWD4GQI3twwD3XZMlMRmv80rmFcBw/O58+ye
 SVZWohQaQKWVfmdi4ubz+BE84nRzwXHgkHyabgtcfM+6qxHCNilc6DK+CcTcur6URnmX
 WnEB/PMImDo+Vh2gOJOTmaREKZ5PB8ZUK0236qJVBoB01iTEj84YhaSO+D9Bm0fIRNo+
 2f8NatTX3uoSHaPHZqthsaq38HbjRmvnyo273iFyGDXtxoSkr3Dg1PMfXWZUkREfj1Xv
 afag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zSpMJELFSrYc8zHtKHbtKdtP/qKMyKq7CRfuycoBJuc=;
 b=lZme3dgmfto1+gUM4xnZTdFYE70UmvD1JNyY6BhRU5MLp4XlxG/auIWQU472HemjbW
 qpUn5mrEXdcNxfkac8DZMHJDJvI38K8O2SafbAMaL34Sa6ty/rv/kACqOO145sRrT4y7
 WekR3+xaN94WlfnrBbKVdQ15qrzvoCKhmWQHuzn99rFE3pc08ye0+fgrYOYrpv4x3bca
 VFamVexQ1WCKV4GOZklrWASNndmfAvAJHGavVPsqDlnt8c4tHTbYu2vDr+y45bjrJpSy
 /sP3LBZw7RznOeB31BY5+5p+GVVD8o6ZzoVo1JF/mTyGLIDCv7S3+I6P9/2/wwOozu5Q
 A6GA==
X-Gm-Message-State: AOAM533LnX8HvC76RQyT16o7hh9zV0X0D9xD9QRiMiganNnxZag6hSGL
 0pM0pyAoYRTtKP9Sisg+2JM=
X-Google-Smtp-Source: ABdhPJxkhUUlXNeNhX7dt2O1ZPnSB3gR9fqJCDPTLQ9UZy7+biPGWzbLJ31liQVDQ52R4/+A0Tsfzg==
X-Received: by 2002:a05:600c:2283:: with SMTP id
 3mr3866767wmf.37.1598523790404; 
 Thu, 27 Aug 2020 03:23:10 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.187])
 by smtp.gmail.com with ESMTPSA id g8sm4439367wme.13.2020.08.27.03.23.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 03:23:09 -0700 (PDT)
Subject: Re: [PATCH v4 09/17] arm64: dts: mt8183: add encoder node
To: Alexandre Courbot <acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
 <20200821103608.2310097-10-acourbot@chromium.org>
 <02eaeace-22dd-02ea-7162-90200fe1cffe@gmail.com>
 <CAPBb6MWZRKpg-rs7X_j3tqqsYHy=NkEMN1NdZwPS9zo-0whTJw@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <184d895c-239e-3f23-970e-6a9563235cd9@gmail.com>
Date: Thu, 27 Aug 2020 12:23:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAPBb6MWZRKpg-rs7X_j3tqqsYHy=NkEMN1NdZwPS9zo-0whTJw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_062311_732291_10FF6CAD 
X-CRM114-Status: GOOD (  24.93  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 devicetree <devicetree@vger.kernel.org>,
 Yunfei Dong <yunfei.dong@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Alexandre,

On 27/08/2020 12:10, Alexandre Courbot wrote:
> On Thu, Aug 27, 2020 at 7:03 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>>
>>
>>
>> On 21/08/2020 12:36, Alexandre Courbot wrote:
>>> Now that the MT8183 encoder driver is ready, add its DT node. Also pull
>>> the iommu and scp ones, which the encoder depends upon.
>>
>> Please don't do that. Instead of pulling in other DT nodes, it would be handy to
>> get a reference of the series this is based on.
>>
>> Let me try to hunt them down now :)
> 
> Sorry, I'm not sure to understand - do you mean each node should come
> with its own patch? Or that all the code should be merged before
> sending these nodes? The rest of this series should land into the
> media tree soon, if you prefer I can resend this patch separately once
> that happens.
> 

What I'm talking about is the case when you send a series that's based on 
another one and the latter is not yet accepted in Torvalds tree. In that case it 
helps to point to the series you expect to be included as well.

In this case the SCP series was merged long time ago, but I missed the DTS 
change. It would have been good if you would have added that information in your 
series, instead of directly pulling in the SCP node.

For the iommu node: I understand that there was never a patch adding the node 
(at least I wasn't able to find one). So I'd prefer to have it send as a 
separate patch of this series.

Regarding this series now. If you want just resend the two DTS patches (iommu 
and vcodec_enc) once the rest of this series got accpeted. If for any other 
reason you have to send a v5, then feel free to include both in v5.

Hope I explained myself now :)

Regards,
Matthias

>>
>> Regards,
>> Matthias
>>
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
>>> ---
>>>    arch/arm64/boot/dts/mediatek/mt8183-evb.dts   | 10 ++++++
>>>    .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 12 +++++++
>>>    arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 36 +++++++++++++++++++
>>>    3 files changed, 58 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
>>> index ae405bd8f06b..9e77b420eee8 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
>>> @@ -25,6 +25,16 @@ memory@40000000 {
>>>        chosen {
>>>                stdout-path = "serial0:921600n8";
>>>        };
>>> +     reserved-memory {
>>> +             #address-cells = <2>;
>>> +             #size-cells = <2>;
>>> +             ranges;
>>> +             scp_mem_reserved: scp_mem_region {
>>> +                     compatible = "shared-dma-pool";
>>> +                     reg = <0 0x50000000 0 0x2900000>;
>>> +                     no-map;
>>> +             };
>>> +     };
>>>    };
>>>
>>>    &auxadc {
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>>> index f0a070535b34..3c763be658da 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>>> @@ -90,6 +90,18 @@ pp3300_alw: regulator6 {
>>>                regulator-max-microvolt = <3300000>;
>>>        };
>>>
>>> +     reserved_memory: reserved-memory {
>>> +             #address-cells = <2>;
>>> +             #size-cells = <2>;
>>> +             ranges;
>>> +
>>> +             scp_mem_reserved: scp_mem_region {
>>> +                     compatible = "shared-dma-pool";
>>> +                     reg = <0 0x50000000 0 0x2900000>;
>>> +                     no-map;
>>> +             };
>>> +     };
>>> +
>>>        max98357a: codec0 {
>>>                compatible = "maxim,max98357a";
>>>                sdmode-gpios = <&pio 175 0>;
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>>> index 102105871db2..8f77eea6df27 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>>> @@ -8,6 +8,7 @@
>>>    #include <dt-bindings/clock/mt8183-clk.h>
>>>    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>    #include <dt-bindings/interrupt-controller/irq.h>
>>> +#include <dt-bindings/memory/mt8183-larb-port.h>
>>>    #include <dt-bindings/reset-controller/mt8183-resets.h>
>>>    #include <dt-bindings/phy/phy.h>
>>>    #include "mt8183-pinfunc.h"
>>> @@ -339,6 +340,25 @@ pwrap: pwrap@1000d000 {
>>>                        clock-names = "spi", "wrap";
>>>                };
>>>
>>> +             iommu: iommu@10205000 {
>>> +                     compatible = "mediatek,mt8183-m4u";
>>> +                     reg = <0 0x10205000 0 0x1000>;
>>> +                     interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_LOW>;
>>> +                     #iommu-cells = <1>;
>>> +             };
>>> +
>>> +             scp: scp@10500000 {
>>> +                     compatible = "mediatek,mt8183-scp";
>>> +                     reg = <0 0x10500000 0 0x80000>,
>>> +                           <0 0x105c0000 0 0x19080>;
>>> +                     reg-names = "sram", "cfg";
>>> +                     interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>>> +                     clocks = <&infracfg CLK_INFRA_SCPSYS>;
>>> +                     clock-names = "main";
>>> +                     memory-region = <&scp_mem_reserved>;
>>> +                     status = "disabled";
>>> +             };
>>> +
>>>                systimer: timer@10017000 {
>>>                        compatible = "mediatek,mt8183-timer",
>>>                                     "mediatek,mt6765-timer";
>>> @@ -772,6 +792,22 @@ vencsys: syscon@17000000 {
>>>                        #clock-cells = <1>;
>>>                };
>>>
>>> +             vcodec_enc: vcodec@17020000 {
>>> +                     compatible = "mediatek,mt8183-vcodec-enc";
>>> +                     reg = <0 0x17020000 0 0x1000>;
>>> +                     interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_LOW>;
>>> +                     iommus = <&iommu M4U_PORT_VENC_REC>,
>>> +                              <&iommu M4U_PORT_VENC_BSDMA>,
>>> +                              <&iommu M4U_PORT_VENC_RD_COMV>,
>>> +                              <&iommu M4U_PORT_VENC_CUR_LUMA>,
>>> +                              <&iommu M4U_PORT_VENC_CUR_CHROMA>,
>>> +                              <&iommu M4U_PORT_VENC_REF_LUMA>,
>>> +                              <&iommu M4U_PORT_VENC_REF_CHROMA>;
>>> +                     mediatek,scp = <&scp>;
>>> +                     clocks = <&vencsys CLK_VENC_VENC>;
>>> +                     clock-names = "MT_CG_VENC";
>>> +             };
>>> +
>>>                ipu_conn: syscon@19000000 {
>>>                        compatible = "mediatek,mt8183-ipu_conn", "syscon";
>>>                        reg = <0 0x19000000 0 0x1000>;
>>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
