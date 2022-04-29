Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660D1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 12:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dO2iDSTKdP58L3a5HOdCnukbZgJ+48Gc1MJJF9Qg9Co=; b=UxG9MgaG2Bxtoa
	rwzyXB859MSp75A7yr9fTnohFgzKVOOLBnWeQijjzkPrsejAXuX1nRSuakTmVJWiToGxnmC9FZ9na
	z7tC3RUn2WwtilHj8ix2u0qNPbdCldDfnrIjovwsWkfB3+iaoMmEwcDFLcLxeQJb4A3W+339E3o7D
	CEYA+WPIjF02e92ID2XsiJe6pMetlcuXDFUBeCrsOVfIPlAW0nHcIHwLIzpP7frEdD0qpeniDTle0
	l0zVDCY/bg4dj4EeW563sNwZggbpRFzXnQrzoRD7tAL5LjdWvR3K6PPr/Zz3vRKPtpaNeEvz1i7Lq
	yHWyIUPI0ACWV/Wu6+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkQBd-00BHJ8-Qa; Fri, 29 Apr 2022 12:57:29 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkQBR-00BHF4-KT; Fri, 29 Apr 2022 12:57:19 +0000
Received: by mail-wr1-x42d.google.com with SMTP id d5so10690942wrb.6;
 Fri, 29 Apr 2022 05:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ePG6wKCbyk/Ae1arQi0XeTIwAd5LTspuTNbaM+4UP34=;
 b=UhDeT+7OtGdUNKYaRyYzF4YBjNiqiG5cYbp0NWSnSrluhsGjG6xPIOa/eMOslCx/VC
 t5MHMquFHD0iip2929xPOiKtfcZ7f7Kqyne/BGIHZtW0+1IXEEnNWPhHLQuKrUfZm56I
 9MWvhTeIbw3HTkCcUtk4saxKmzHFZqX3ZCB+WWrtNtRnHsgon3MF5RqJ9xvGQws7/0mS
 b+KAA0MqsPPuKd+MsdTJD2DsZatnp/1g7cxsoG0dVaw4lhJmg2PfwCrWeXpcHA3xyvHa
 1U/RSSLyuPWacNUUqAFTW/EiOcufG4eM4aUy+7Ho0cBqUS68URBRmHKyevMB67igwyIh
 HVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ePG6wKCbyk/Ae1arQi0XeTIwAd5LTspuTNbaM+4UP34=;
 b=geG3NsPBqSgEQuDT0NJ4DCYDKh2ytg5DgDZJPCD61TlsRzjuVCcC56FBgu0JHy17WO
 NBuXzY0eesIhrsUULHz9uiA2hlKUpLRqBjY6ceRvuDZ7mlvzrg3Np3mDg4AAB67MFMN0
 Z+hMJqikhKAD9LPNmwiKt+VrWWE+d1V5B7N6zXUfoYoM6c0wifmGRFXaa+hdghJ80OPL
 ocpZSBggyXNOVVahzf2/LckHFHG/ZdSoTWby117p9MGXi/IVYGFaEcbu4tro9QFpnJLQ
 paxFpl/x1EgYJVybjSrrfo6/Br8WAd4lAkI/lv6RmdrOK9tH4AdnBawH+qhY8TWUH0tf
 MNWQ==
X-Gm-Message-State: AOAM530asXfBRAcXBLw4ldmk7zR2rTbC7Q5YzjzLd0Kmx2Lvqv/AJOnU
 AOcyUupLtEoeZT0/bYhbBKY=
X-Google-Smtp-Source: ABdhPJx9iOmaDdFy/exNMf07wrNEg2EtThd5KGiPKJ773aQXEiQRCBTb7PUS/mCPw+1r7dSeJNOlxg==
X-Received: by 2002:adf:ec92:0:b0:20a:d261:2cf2 with SMTP id
 z18-20020adfec92000000b0020ad2612cf2mr25223015wrn.296.1651237034054; 
 Fri, 29 Apr 2022 05:57:14 -0700 (PDT)
Received: from [192.168.0.43] (static-35-180-85-188.ipcom.comunitel.net.
 [188.85.180.35]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c350900b00393f01c8f00sm6986212wmq.47.2022.04.29.05.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 05:57:13 -0700 (PDT)
Message-ID: <cf9b425e-84ff-af12-72a7-4056b8cbf90d@gmail.com>
Date: Fri, 29 Apr 2022 14:57:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4] dt-bindings: dsp: mediatek: add mt8195 dsp document
Content-Language: en-US
To: YC Hung <yc.hung@mediatek.com>, Rob Herring <robh@kernel.org>,
 broonie@kernel.org
Cc: robh+dt@kernel.org, daniel.baluta@nxp.com, trevor.wu@mediatek.com,
 tiwai@suse.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 cezary.rojewski@intel.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 allen-kh.cheng@mediatek.com
References: <20220106064847.15588-1-yc.hung@mediatek.com>
 <Yd4yNkeGlzdULNlv@robh.at.kernel.org>
 <68895a40-559b-13ce-d433-f9b32c648323@gmail.com>
 <9965188904de2e89bc5390fa6c71d9fb243f9d12.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <9965188904de2e89bc5390fa6c71d9fb243f9d12.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_055717_747632_4187470D 
X-CRM114-Status: GOOD (  14.70  )
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

Hi,

On 29/04/2022 07:59, YC Hung wrote:
> Hi Mattias/Rob,
> 
> Sorry I miss this mail.
> Could you please help to check this patch? Thanks.
> 

Rob gave his reviewed-by. I just saw that the driver maintainer is Mark, so I 
expect him to take the patch through his tree. Didn't realized this beforehand.

Regards,
Matthias

> On Fri, 2022-01-14 at 13:56 +0100, Matthias Brugger wrote:
>>
>> On 12/01/2022 02:43, Rob Herring wrote:
>>> On Thu, 06 Jan 2022 14:48:48 +0800, YC Hung wrote:
>>>> From: "YC Hung" <yc.hung@mediatek.com>
>>>>
>>>> This patch adds mt8195 dsp document. The dsp is used for Sound
>>>> Open
>>>> Firmware driver node. It includes registers,  clocks, memory
>>>> regions,
>>>> and mailbox for dsp.
>>>>
>>>> Signed-off-by: yc.hung <yc.hung@mediatek.com>
>>>> ---
>>>> Changes since v3:
>>>>     Fix patch v3 error : v3 only provide difference between v3 and
>>>> v2.
>>>>
>>>> Changes since v2:
>>>>     Remove useless watchdog interrupt.
>>>>     Add commit message more detail description.
>>>>
>>>> Changes since v1:
>>>>     Rename yaml file name as mediatek,mt8195-dsp.yaml
>>>>     Refine descriptions for mailbox, memory-region and drop unused
>>>> labels
>>>>     in examples.
>>>> ---
>>>>    .../bindings/dsp/mediatek,mt8195-dsp.yaml     | 105
>>>> ++++++++++++++++++
>>>>    1 file changed, 105 insertions(+)
>>>>    create mode 100644
>>>> Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
>>>>
>>>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>
>>
>> Rob, it seems we don't have a maintainer for this bindings. Shall I
>> as MediaTek
>> SoC maintainer take them through my branch?
>>
>> Regards,
>> Matthias
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
