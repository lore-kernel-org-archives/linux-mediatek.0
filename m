Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31397C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 12:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TSyawZIzuoDy5PmxjcaM0HZKsVKgzrA8e6a5JssMFIg=; b=sYDacCbHxQCtT9
	xJdYGd+QxkRFMosmxbui/QQLj4NmTo9zYI9U56tFcIME70ixrXmxD1bYYCBd7aGPDkKhc1GxggHqO
	dVTyGyhfnjHNg5rMAaTNyIjxQ3kqtMnDXXdmMvqo+JzX9W/ZbytIUx1JOTIljM6gdj9+89iVe14gs
	QYIvaf1mzfXcEOmBRukNIfsp2/EopnuonP+zc6cB+l9zDyfwWRhGZ0MIucVZcLAJW2Es7sIYy8TLb
	1hDKXHv5pq79LwCJnUIwj8ivrtggRSZ7o6Yyf4/4Dzp+2ZZBQWJhex0zsxpOfL3M+xRxX8MWomO9R
	Rx/+Tw7OeJ3W8RXkl5uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZX9f-00FaAl-Ti; Wed, 30 Mar 2022 12:10:27 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZWpd-00FQIm-Qo
 for linux-mediatek@lists.infradead.org; Wed, 30 Mar 2022 11:49:47 +0000
Received: by mail-wr1-x435.google.com with SMTP id u3so28935345wrg.3
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Mar 2022 04:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Zz5V7y6zyX28uzHv7nbJNO/THNVqL6J0WR2WWuQ7SCY=;
 b=ZUOogO2MuK6NJjubHjbfEz+haJ4Oh6ePGA6/+gd7oK40h63IMjwzaVvnJYUmTxImAs
 MyvMzaw35CVlu+C1Qwxa9gZov8B7ynpIwE3Kahpcz6sN0ho/mSj65L6ftNnsKk0N0nfj
 4FD0bVTJb2fmEnKM40jG3JvPfGa1UEDFrVUzYozFy2JbNwdiOUCDqvoRUU5p/1MuvQtk
 H1t8//3ATlKAdlXRm+jWADGLrIYnbjN2Vd+1QzD13qGQn0d2D1eJ8SeQBqJ9cpJE8m8y
 rxQTaDbTj6arnFaptoXI1QxDOgI01CGVevoN+fRv/LEDGV5rgU6D1hGjCmYn3/CIg8i5
 eoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Zz5V7y6zyX28uzHv7nbJNO/THNVqL6J0WR2WWuQ7SCY=;
 b=0a3hZHKiGYRedF5euatR5FcLfLCAs2GUn4+j+lrSQqXbyusGunOE+Liw4VtSVw17AA
 74VX8K6n3WCStb1bEM5CMZQ4bde+fdYXDu0RD6V1bz4PQIE3shbrZ0jFRsSjTp+RpllD
 rsfLVJUW/XBS2j3pSo8GP9mZ9D5WTrmkQha5thILUaNhZy3/5hgyLJEcJO+9Tyvn19jv
 a6QrGQI/WkKxlplImJYtm9Ltcjp8TNdr7PeuBiHObL4fy/TGepNDPSTPnQzBdTsyIxez
 nTOCdbKvaGgalaiOEyppo7vnD7zxkg1yxnS+Jfc+OzPY9TSjeJ3l0xviKGfAXZE1p5pc
 Ty8g==
X-Gm-Message-State: AOAM533uEc6H4jiaRzbmv7bOUfEsi5GVrxs9I2U6CHWaXiZ23V+Ry2LZ
 BFZS5kq+7XIN+fPXtcjv/N6WEg==
X-Google-Smtp-Source: ABdhPJxlxhSbqKiKCa9E9IGILcoh2/H6PVy3wwrQdQj0w9n8pdqxILCg+dwurPk7Vv6V2VCi3BDOrQ==
X-Received: by 2002:adf:d1e5:0:b0:205:85f5:656c with SMTP id
 g5-20020adfd1e5000000b0020585f5656cmr35738237wrd.65.1648640983633; 
 Wed, 30 Mar 2022 04:49:43 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ed2f:f020:8f92:3217:a3c6:3ee8?
 ([2a01:e34:ed2f:f020:8f92:3217:a3c6:3ee8])
 by smtp.googlemail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037fa93193a8sm5539221wmp.44.2022.03.30.04.49.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 04:49:43 -0700 (PDT)
Message-ID: <98be733a-62b0-4cf6-ab27-992ea49da5b1@linaro.org>
Date: Wed, 30 Mar 2022 13:49:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 1/4] dt-bindings: timer: Add compatible for Mediatek
 MT8186
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: hsinyi@chromium.org, Thomas Gleixner <tglx@linutronix.de>,
 Guenter Roeck <linux@roeck-us.net>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
References: <20220311130732.22706-1-allen-kh.cheng@mediatek.com>
 <20220311130732.22706-2-allen-kh.cheng@mediatek.com>
 <Yitv3IUpCzp1/eGX@robh.at.kernel.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <Yitv3IUpCzp1/eGX@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_044945_963724_A5E55617 
X-CRM114-Status: GOOD (  10.53  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMTEvMDMvMjAyMiAxNjo1MCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gRnJpLCAxMSBNYXIg
MjAyMiAyMTowNzoyOSArMDgwMCwgQWxsZW4tS0ggQ2hlbmcgd3JvdGU6Cj4+IEZyb206IEFsbGVu
LUtIIENoZW5nIDxBbGxlbi1LSC5DaGVuZ0BtZWRpYXRlay5jb20+Cj4+Cj4+IFRoaXMgY29tbWl0
IGFkZHMgZHQtYmluZGluZyBkb2N1bWVudGF0aW9uIG9mIHRpbWVyIGZvciBNZWRpYXRlayBNVDgx
ODYgU29DCj4+IFBsYXRmb3JtLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbGxlbi1LSCBDaGVuZyA8
QWxsZW4tS0guQ2hlbmdAbWVkaWF0ZWsuY29tPgo+PiAtLS0KPj4gICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdGltZXIvbWVkaWF0ZWssbXRrLXRpbWVyLnR4dCB8IDEgKwo+PiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+IAo+IEFja2VkLWJ5OiBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPgoKQXBwbGllZCwgdGhhbmtzCgotLSAKPGh0dHA6Ly93d3cu
bGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0g
U29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5h
cm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIg
fAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
