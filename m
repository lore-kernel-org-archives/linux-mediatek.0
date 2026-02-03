Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29A7E8B36D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Feb 2026 22:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7c0NPTkqLZrpseRrb77cJ9keUj/pZc1R94Glr/7UpBo=; b=UR+mKF0LE7BzO2E5kKpVJoYdB8
	nKffnhffSX+zGDbTJ/+O3b62ImnMexaP5YnuRnI/27YPnUiegdy2Xlv16/ZP6shPOw8cKHnzyBcjf
	oGR9LMs66aZzh5asM7AexL1ZS1WT5rD7OEYPzwHct088+WFy4ZuKy91LvCXyKXi24POJUgcrSak1W
	v0G88HYnBKYtuNUN3+2o7+rjIMHIRhG93JjKVggkXdwDCU1fCj9Q4B0W/86PIY8IvDzxwielgmoD/
	FcKBB5sX/8oOzsULUn5HPWuFp9g/memaxJyMrzPrMdA4XcQfZkYEtTEC2YPBDmmJcYah5rZlUJIvU
	/djFG1Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnOh7-00000007TYX-0wyz;
	Tue, 03 Feb 2026 22:16:25 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnOh2-00000007TXU-3YZk
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Feb 2026 22:16:23 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-6611cab8ca3so3894625eaf.3
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Feb 2026 14:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770156979; x=1770761779; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7c0NPTkqLZrpseRrb77cJ9keUj/pZc1R94Glr/7UpBo=;
        b=ffM8O8DHJ6C0wmvlRpdvXnP2sIEUrcHUx2TuvBKq9Ww0iC7vSy1WkOqvCKy1QEFtLV
         qBFkVpTsaeXuLcgRKkndcXjLmGJWpzmzh02P+D4cEXKVU5yaotUw3Z8O21uiPid3mPPr
         l4D38FU2H0Ae7DaszyFU7kIBJdjbsPs55rTn1na+Ll+/rG52WQjNa7Ju6/HBQ57mwh4w
         A1cx1Y+y65hLcTQtfaDtdNXgYRiJ944BMAviWUqVjBGZTOoBEipAHdoN6SDxcqfHyjJf
         8EAB2aF8BpAa/O5N+WyrEBlhEAARy4NKhsTzHDlDEFOK/QBXYpMwn3S+ONn85Q20pOeM
         Xklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770156979; x=1770761779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7c0NPTkqLZrpseRrb77cJ9keUj/pZc1R94Glr/7UpBo=;
        b=Bbg/hF5CNzd8G+gimvQiav16wFG/uAiAwkP9ALUxRRFMfH0MehnaefUqiri0iGCfUL
         6D7MyFJ4n/LDC3a4geNm78ZWG5LZUba8umpRD4C8wks+s9KeR8cw4J+oVcIx8mLb0ed+
         T4Tc7d9xLR7fhrsZ//zxJGbUFh8QMjTG0qXtSHeIsL+OS/eN39yWFZKtYOIq+vBo5TGk
         O/EU3u7D/BDoUnSL7S13IiQJEVFXd/V6EmPJ1nbpfkXAQvobvxYOJY94uKnQ3XR1SqYR
         YJ430HuMdGF+DeC1xKYu/rk8du33fduD4Sy7MVg3tMX947JpAx5bKMGTGz5RqsZV2gLe
         j1Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXw73hnUMDUP6CorqEoFLa43ktn+rObsrY4fQU2baV3lQPB23abBX91gBD8PABB5r+2f9jpm9J/EL2GkgK5TQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSOnxgNxU2/7rYo8DmJnJwFZXbxbH23/Z8QYpJcZXyGCsptc1Q
	+WSlmFDpvzHHRyd3kM2RpsgOocPVdLpyp7tP6fm68ULhm23AzsRHzeEQPpqjbltr860=
X-Gm-Gg: AZuq6aLtxf+fbZ/MXH31Gy91QTZRMYGvcuiL1jPCT7awI4zwpepRpoRMKvYSTiJ4r73
	thqp/B4jct9JEll+AEbnNXLAUYVi1fB6GF0Ic8Gmt3cAkSj8qjZ8IUR+Bzuw68liQuB4ySpBxhc
	AboSOAlMUrOIvyaUNF5PaJM7Wy188cmVy6Yt7HLVdVa6kLdXoU3Sc36ilOD8xct+l7UXwyN7fqq
	DTkaq4F8kEhVb41o6js2yLlmGQQSie+raRQIJMnVMNQTeIWv4p3owJOqEf9O6bWkn1eWCFdGJMW
	D+FO+CuEYs7ShMAl8BDp8c4Rr8ozhr6eT8sHSywYVMjsv6U1UBR1yFsynG2BsYCge6BeAqyw3ac
	BQlOmv77FcdVAwFS3nZ87B3zfAblp/SqjUnYOnD7+ZIH5Q8hkucl+tDslhxUR9lYvaEAkrZ80NK
	2T6q+9hD9KCgbtcNxg3WfyEvdhWuQ5VbuLQfA0V7Kbp22tNj++H5zxTe8=
X-Received: by 2002:a05:6820:f09:b0:65f:66c5:c3e with SMTP id 006d021491bc7-66a20d658eemr547793eaf.22.1770156979083;
        Tue, 03 Feb 2026 14:16:19 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:8e13:880:992:e796? ([2600:8803:e7e4:500:8e13:880:992:e796])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40a544e77fdsm481769fac.21.2026.02.03.14.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 14:16:18 -0800 (PST)
Message-ID: <37d5b1a4-93e2-4fde-ab56-186d34f8835b@baylibre.com>
Date: Tue, 3 Feb 2026 16:16:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/18] dt-bindings: clock: Add MediaTek MT8189 clock
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
References: <20260202062840.342707-1-irving-ch.lin@mediatek.com>
 <20260202062840.342707-2-irving-ch.lin@mediatek.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260202062840.342707-2-irving-ch.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_141621_136110_CD2F3266 
X-CRM114-Status: UNSURE (   9.49  )
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

On 2/2/26 12:28 AM, irving.ch.lin wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
>
> Add dt schema and IDs for the clocks of MediaTek MT8189 SoC.
> The MT8189 clock IP provide clock control for main system
> (apmixedsys, topcksys and vlpcksys) and
> subsys (eg. peri, mfg, venc/vdec ...).
>

> +#define CLK_TOP_VOWPLL                                  174

This one seems out of place. It is not used in the driver. It is
a fixed 1:1 divider AFAKCT, so should not be included. (And this
line has spaces while the rest of the file uses tabs for indent.)



