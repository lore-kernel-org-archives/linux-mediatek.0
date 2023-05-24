Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB15C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 13:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpaEDaEMiz0twNyfrOrBugRFe4goGloP1Qpqk47QwlA=; b=o9Tl2W7QsRXKJamSx8Vn6J0D+r
	xtDDT2rG9Kag6vyzX7XvkuKIVeWwSOPYF5REQfP/IGO7ZNU2kumY4r9snOuj4WQtit5RLARDAhD69
	V65Cm/W6Q8kzqwkxmzgnZS7XuWXLdj6rinQi3kwFvhQNW1Rz9lQDiSOXV4Mt2Oouea4nqm7oVllwe
	O21TULk4vqdMiNSzkbtrHYnk6c4HhiptszDQktDVCWcJf3HNf8JJo8/4QrAHJ2yBB4GFzVYn/fN8d
	fi37uDTd7D7xaMYylm+7N3JoM6nDk86nXO75i3huOaZSJyRqCFnbtTf2JlqZ4ks8dm4wFgdenLJrp
	+2dmIF0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1oXo-00DZLt-2u;
	Wed, 24 May 2023 13:28:48 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1oXk-00DZKF-20
	for linux-mediatek@lists.infradead.org;
	Wed, 24 May 2023 13:28:47 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f606912ebaso11218755e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 24 May 2023 06:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684934921; x=1687526921;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dpaEDaEMiz0twNyfrOrBugRFe4goGloP1Qpqk47QwlA=;
        b=RRpnCjpjHBTwE/i8foXECp1howHpUJB08S3RDHVRKvOK+eeAwsKC3x39tLqwNhysca
         cI/sZp9eC0H8WA5MnMR3Wck3kwLEVf86vv/q5HMBHGSWy4KCGj8fcAyYih8bFlYz+sdD
         pxEo14qjxYnXZIROoJUVb/epU2pySWQZPM/UhVVhdK+inP5pxhiZDg0rcJ8490MDOf2D
         lFZHi9cri7PBUqx0937e80otPcYbB6cxD6Aov9gHkFGDb0QFamRLyqrj2Ycmk3UH1NrR
         hoc4lFkin632699KFRBucYZo/CD34eAaRYyFXiPx/o7vUmZC9N/i30ORAGH8AuOAj9jx
         oGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684934921; x=1687526921;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dpaEDaEMiz0twNyfrOrBugRFe4goGloP1Qpqk47QwlA=;
        b=AZEnPCVL8tCzbBq1pThr4cxc1VTByXOG5GnOzOWrzmEvggV+oI/yyPENfabYx8OFTV
         sy/YV89BfvhFTCrSZXFRUqSD3pO8JPjLKdS8rek0j6EQcMpPR99VWZ7CgSTkhNAiEahy
         mKao9Zc2SYIidl7dWGIZm3j3B9k70osTh/O70r0BYpFuT6yM/qp8ZVFtsiqQJhxv6sJp
         meNiGlGOEqgUg+s7QxMKYgGORpy6087rZWXj76PjtGi2u4+mXFYmVzc2k8IrTSlGjRm7
         4Lpb3vfUgCWef7dgI9WJquNHgybcRwwCHhsuA2awu4Iu4cRbIc5aTVquL21nWboc+SAK
         E+DQ==
X-Gm-Message-State: AC+VfDzzP2Xc3qRHDlpL2wa2BJuO3bsILLnBJOnrCElWQ6AahtnIyGrY
	fBGepDmE72lmAYMAZ4YYMBp0xg==
X-Google-Smtp-Source: ACHHUZ5UxTF7Ty4Ha1qHIPwkF1euAKvGxSLopaZQrr7mrvaQchq5F7/btnqI5+pGB6je42At5/7vFA==
X-Received: by 2002:adf:ff90:0:b0:309:ccad:b2fb with SMTP id j16-20020adfff90000000b00309ccadb2fbmr10813993wrr.5.1684934920688;
        Wed, 24 May 2023 06:28:40 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id j3-20020a5d4483000000b003062b57ffd1sm14483595wrq.50.2023.05.24.06.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 06:28:39 -0700 (PDT)
Message-ID: <56b892cd-977e-5b24-55f0-df25e187308b@baylibre.com>
Date: Wed, 24 May 2023 15:28:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/7] ASoC: dt-bindings: mediatek,mt8188-mt6359: remove
 ADDA_BE from link-name
Content-Language: en-US
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "tiwai@suse.com"
 <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20230523021933.3422-1-trevor.wu@mediatek.com>
 <20230523021933.3422-3-trevor.wu@mediatek.com>
 <cb69dbab-0966-8ecb-d9b9-017f430fd7ea@baylibre.com>
 <b9eecdf886b6496131e51e1e2f49536c782c3b67.camel@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <b9eecdf886b6496131e51e1e2f49536c782c3b67.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_062844_893408_48182D50 
X-CRM114-Status: GOOD (  20.76  )
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

On 24/05/2023 04:25, Trevor Wu (吳文良) wrote:
> On Tue, 2023-05-23 at 18:26 +0200, Alexandre Mergnat wrote:
>> On 23/05/2023 04:19, Trevor Wu wrote:
>>> ADDA_BE is used to connect to mt6359. For machine mt8188-mt6359,
>>> codec
>>> for ADDA_BE must be mt6359 which are configured on the machine
>>> driver.
>>> Besides, ADDA_BE is divided into two dais, UL_SRC_BE and DL_SRC_BE.
>>> As a result, remove ADDA_BE from items of link-name.
>>>
>>> Signed-off-by: Trevor Wu<trevor.wu@mediatek.com>
>>
>> I don't understand how "DL_SRC_BE" and "UL_SRC_BE" links are done.
>> Why these dais don't replace "ADDA_BE" in this binding ?
>>
>> Regards,
>> Alexandre
>>
> 
> Hi Alexandre,
> 
> Because the sound card is mt8188-mt6359, the codec for these two links
> must be mt6359. Thus, I specifiy the codec in machine driver directly.
> If the codec is changed, there will be a new sound card and binding
> file. In conclusion, the codec won't be updated via dts, and that's why
> I don't just replace ADDA_BE in this binding.
> 
> Do you suggest me add some information in the commit message?

No it's fine, I'm just trying to understand.

When you say "I specifiy the codec in machine driver directly", you
are talking about this change ?

+		} else if (strcmp(dai_link->name, "DL_SRC_BE") == 0 ||
+			   strcmp(dai_link->name, "UL_SRC_BE") == 0) {
+			if (!init_mt6359) {
+				dai_link->init = mt8188_mt6359_init;

I'm asking because the equivalent was done here:

-	[DAI_LINK_ADDA_BE] = {
-		.name = "ADDA_BE",
+	[DAI_LINK_DL_SRC_BE] = {
+		.name = "DL_SRC_BE",
  		.no_pcm = 1,
  		.dpcm_playback = 1,
-		.dpcm_capture = 1,
-		.init = mt8188_mt6359_init,
-		SND_SOC_DAILINK_REG(adda),
+		SND_SOC_DAILINK_REG(dl_src),

So I'm wondering why "ADDA_BE" & "DPTX_BE" & "ETDM3_OUT_BE" are in the 
enum list of the binding since the codec is already specified in
machine driver too. I probably miss something but I don't know what.

-- 
Regards,
Alexandre


