Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A33CC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 09:39:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E478613B0
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 09:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E478613B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BHUOReav5tF1vRt4lKmhzZ53TTSPEKegD4V91Pnhyig=; b=rBow/1ACel7tAGMa7i52ma+5X
	/erK30u+7gfbfdBNbNbPSqbX1VgqdGMz8VDkjtGlQzjd3PKT/ys8htbw8+eeAukICzg42AkkqP3G4
	QG6qNTIXNVWc2mkyIRrZO9qst+4Hcpqg1mgqQfnlraGd6w6G70F4tZPxuOseqt/YQRuYa1m3AiF4V
	lp0iX9iV4nvqqZs6R343MxMroFeyke/HwqwN2610bzledYdWNrerHKuIAIxuhZwhr6waRRil0Y6a+
	O5K49UPYrB5G7e5HgvMsmoHLj9NJ9Cx4KZk+bztcmjMHX7trH0c4KbryefmmyPl95+QbEqpSvtIdH
	uOSGHavgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYmqf-00BnMr-KC; Tue, 20 Apr 2021 09:39:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYmqc-00BnME-5Q; Tue, 20 Apr 2021 09:39:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References
 :Cc:To:Sender:Reply-To:Content-ID:Content-Description;
 bh=0cgFeiaCJmuEwdxXqsfxCg9P2r8ydkzAaV1kqEK2h0w=; b=ED07wwu+Xe65gnHDcNu/wMpzcV
 MLuTXAfYmx32xsJM/u8KLtO/IOz3FLFJZBM30VRkRifvKvMzZ04JdNK7aC3jvEfPcsYWAyjmDVLFB
 LdGh3uH3W8G1US77Au5/tV50ZzVVs+peepH+ed73TVE+Zsi7AKJxUCsiPxLSTRDl6g+eudGHE/4/U
 gnOGdGfUr/M+a0wsBqRl0rWHQdZIzSGj4+Rfyw9R8DwubOmAxuF2v+xD6CPsZaER1VINOBR0zgq0j
 sp9ao3q+HpmxUzLn/WA2iiZjEcJyB5bzlNgThC9yMVtH7M190tFQKotIxNg7D04PhTQfBV4guqEfV
 +6crPDjQ==;
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYmqW-00BzVZ-Ii; Tue, 20 Apr 2021 09:39:08 +0000
Received: by mail-lj1-x235.google.com with SMTP id u25so4443838ljg.7;
 Tue, 20 Apr 2021 02:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0cgFeiaCJmuEwdxXqsfxCg9P2r8ydkzAaV1kqEK2h0w=;
 b=gvB2Kjtuq3c6hDrfV3q09iYFnvk6b3RYxllwzrHlnk+X8nahI/9ZgjrPXry5x6L08J
 ZqUJbyfgrU/17jihKD9RUFrWkKnPLnaOIz5SfrAgdH3V6GQqhJBsJvkRB5ags8nff6/g
 3cv4VDvDqV2sSqUfb8205g5G7kjLsdASVbSOa0/k/nLxNeajkm1KtVIIys66vWeGWX+c
 R9IfZtnbhr3czfjp/hluYCcP4dflvCu/ccDgljZf5znlxpNeSE4/7JXLhxawyn0f1SMK
 6r42KR2eqy29tw7Neimeshqmq4hBcMWCqRWk5EiKSmXItxwa+o1xYehRrMSSHpcpkKnQ
 slWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0cgFeiaCJmuEwdxXqsfxCg9P2r8ydkzAaV1kqEK2h0w=;
 b=KDVN4Z04rjC6StoB1KkSMMJrB+hCPXq5xMyivXqcs/PEAUSJVORBYAPafVHLbS+530
 yV9L/pVSyEQ3OuPYpek21yFrtqXoN2d5g8nbhCxK/8V/03LgSdt3q0EoTLd6zeJ88ydQ
 /Vkkdglo63uyzTOx6s6vKlFIyc5aVH6HvkBDoH4LCNkNoYhWAM23X2aV0bRmTHHzDr/y
 SF2xctRmChL3HaOPMpU9p47QSxT4afai30wWO2DTPcdzkIKFi5KGYwuqWp0Y6vedYOgN
 fJFUXfGG/PPJ0+h+oYBsSxEg3a2kRZ/nB1fFzN9tEO8LSIC6VP/ewUWwvvri7QCj8X0u
 Uytw==
X-Gm-Message-State: AOAM532BoPEiPVjoCsdNGv+SlaNZOHksFniJ2ELI8+UXO08nJtuze60Z
 KDOXYsSZqRHKVKLwDWfPfLE=
X-Google-Smtp-Source: ABdhPJxU9OnhgUvmhfsaX0XQNxKFEPf1HsBVx73r0wgo9gbzwsyEGSVJJz6LhIbQa4C3GIRFxd4WnA==
X-Received: by 2002:a2e:9f49:: with SMTP id v9mr14102607ljk.44.1618911541931; 
 Tue, 20 Apr 2021 02:39:01 -0700 (PDT)
Received: from [10.0.0.42] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id n22sm723197lfu.144.2021.04.20.02.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 02:39:01 -0700 (PDT)
To: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>, gregkh@linuxfoundation.org,
 rafael@kernel.org, horia.geanta@nxp.com, aymen.sghaier@nxp.com,
 herbert@gondor.apana.org.au, davem@davemloft.net, tony@atomide.com,
 geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 vkoul@kernel.org, a.hajda@samsung.com, narmstrong@baylibre.com,
 robert.foss@linaro.org, airlied@linux.ie, daniel@ffwll.ch,
 khilman@baylibre.com, tomba@kernel.org, jyri.sarha@iki.fi, joro@8bytes.org,
 will@kernel.org, mchehab@kernel.org, ulf.hansson@linaro.org,
 adrian.hunter@intel.com, kishon@ti.com, kuba@kernel.org,
 linus.walleij@linaro.org, Roy.Pledge@nxp.com, leoyang.li@nxp.com,
 ssantosh@kernel.org, matthias.bgg@gmail.com, edubezval@gmail.com,
 j-keerthy@ti.com, balbi@kernel.org, linux@prisktech.co.nz,
 stern@rowland.harvard.edu, wim@linux-watchdog.org, linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-staging@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-4-alice.guo@oss.nxp.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [RFC v1 PATCH 3/3] driver: update all the code that use
 soc_device_match
Message-ID: <2924b8af-d176-01b1-a221-5219c1128494@gmail.com>
Date: Tue, 20 Apr 2021 12:40:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210419042722.27554-4-alice.guo@oss.nxp.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_023904_679368_691679E0 
X-CRM114-Status: GOOD (  18.32  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQWxpY2UsCgpPbiA0LzE5LzIxIDc6MjcgQU0sIEFsaWNlIEd1byAoT1NTKSB3cm90ZToKPiBG
cm9tOiBBbGljZSBHdW8gPGFsaWNlLmd1b0BueHAuY29tPgo+IAo+IFVwZGF0ZSBhbGwgdGhlIGNv
ZGUgdGhhdCB1c2Ugc29jX2RldmljZV9tYXRjaCBiZWNhdXNlIGFkZCBzdXBwb3J0IGZvcgo+IHNv
Y19kZXZpY2VfbWF0Y2ggcmV0dXJuaW5nIC1FUFJPQkVfREVGRVIuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQWxpY2UgR3VvIDxhbGljZS5ndW9AbnhwLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9idXMvdGkt
c3lzYy5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9jbGsvcmVu
ZXNhcy9yOGE3Nzk1LWNwZy1tc3NyLmMgICAgICAgIHwgIDQgKysrLQo+ICBkcml2ZXJzL2Nsay9y
ZW5lc2FzL3JjYXItZ2VuMi1jcGcuYyAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL2Nsay9y
ZW5lc2FzL3JjYXItZ2VuMy1jcGcuYyAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL2RtYS9m
c2wtZHBhYTItcWRtYS9kcGFhMi1xZG1hLmMgICAgICAgfCAgNyArKysrKystCj4gIGRyaXZlcnMv
ZG1hL3RpL2szLXBzaWwuYyAgICAgICAgICAgICAgICAgICAgICB8ICAzICsrKwo+ICBkcml2ZXJz
L2RtYS90aS9rMy11ZG1hLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL253bC1kc2kuYyAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMgICAgICAgICAgICAgfCAgNCArKystCj4gIGRyaXZl
cnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kaXNwYy5jICAgICAgICAgICB8ICAyICstCj4gIGRyaXZl
cnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kcGkuYyAgICAgICAgICAgICB8ICA0ICsrKy0KPiAgZHJp
dmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2RzaS5jICAgICAgICAgICAgIHwgIDMgKysrCj4gIGRy
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kc3MuYyAgICAgICAgICAgICB8ICAzICsrKwo+ICBk
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTRfY29yZS5jICAgICAgfCAgMyArKysKPiAg
ZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL3ZlbmMuYyAgICAgICAgICAgIHwgIDQgKysrLQo+
ICBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Rydi5jICAgICAgICAgICAgfCAgMyArKysK
PiAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRjLmMgICAgICAgIHwgIDQgKysr
LQo+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYyAgICAgICAgICAgfCAgMiAr
LQo+ICBkcml2ZXJzL2dwdS9kcm0vdGlkc3MvdGlkc3NfZGlzcGMuYyAgICAgICAgICAgfCAgNCAr
KystCj4gIGRyaXZlcnMvaW9tbXUvaXBtbXUtdm1zYS5jICAgICAgICAgICAgICAgICAgICB8ICA3
ICsrKysrLS0KPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yY2FyLXZpbi9yY2FyLWNvcmUuYyAg
IHwgIDIgKy0KPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yY2FyLXZpbi9yY2FyLWNzaTIuYyAg
IHwgIDIgKy0KPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92c3AxL3ZzcDFfdWlmLmMgICAgICAg
IHwgIDQgKysrLQo+ICBkcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaV9jb3JlLmMgICAgICAg
ICAgfCAgMiArLQo+ICBkcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaV9pbnRlcm5hbF9kbWFj
LmMgfCAgMiArLQo+ICBkcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWVzZGhjLmMgICAgICAgICAg
ICAgfCAyMSArKysrKysrKysrKysrKy0tLS0tCj4gIGRyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb21h
cC5jICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvbW1jL2hvc3Qvc2RoY2lfYW02
NTQuYyAgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVz
YXMvcmF2Yl9tYWluLmMgICAgICB8ICA0ICsrKy0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvdGkv
YW02NS1jcHN3LW51c3MuYyAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvdGkv
Y3Bzdy5jICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvdGkv
Y3Bzd19uZXcuYyAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9waHkvdGkvcGh5LW9tYXAt
dXNiMi5jICAgICAgICAgICAgICAgIHwgIDQgKysrLQo+ICBkcml2ZXJzL3BpbmN0cmwvcmVuZXNh
cy9jb3JlLmMgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3BpbmN0cmwvcmVuZXNh
cy9wZmMtcjhhNzc5MC5jICAgICAgICAgfCAgNSArKysrLQo+ICBkcml2ZXJzL3BpbmN0cmwvcmVu
ZXNhcy9wZmMtcjhhNzc5NC5jICAgICAgICAgfCAgNSArKysrLQo+ICBkcml2ZXJzL3NvYy9mc2wv
ZHBpby9kcGlvLWRyaXZlci5jICAgICAgICAgICAgfCAxMyArKysrKysrKy0tLS0KPiAgZHJpdmVy
cy9zb2MvcmVuZXNhcy9yOGE3NzRjMC1zeXNjLmMgICAgICAgICAgIHwgIDUgKysrKy0KPiAgZHJp
dmVycy9zb2MvcmVuZXNhcy9yOGE3Nzk1LXN5c2MuYyAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJp
dmVycy9zb2MvcmVuZXNhcy9yOGE3Nzk5MC1zeXNjLmMgICAgICAgICAgIHwgIDUgKysrKy0KPiAg
ZHJpdmVycy9zb2MvdGkvazMtcmluZ2FjYy5jICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAg
ZHJpdmVycy9zdGFnaW5nL210NzYyMS1wY2kvcGNpLW10NzYyMS5jICAgICAgIHwgIDIgKy0KPiAg
ZHJpdmVycy90aGVybWFsL3JjYXJfZ2VuM190aGVybWFsLmMgICAgICAgICAgIHwgIDQgKysrLQo+
ICBkcml2ZXJzL3RoZXJtYWwvdGktc29jLXRoZXJtYWwvdGktYmFuZGdhcC5jICAgfCAxMCArKysr
KysrLS0KPiAgZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9yZW5lc2FzX3VzYjMuYyAgICAgICAgIHwg
IDIgKy0KPiAgZHJpdmVycy91c2IvaG9zdC9laGNpLXBsYXRmb3JtLmMgICAgICAgICAgICAgIHwg
IDQgKysrLQo+ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2ktcmNhci5jICAgICAgICAgICAgICAgICAg
fCAgMiArLQo+ICBkcml2ZXJzL3dhdGNoZG9nL3JlbmVzYXNfd2R0LmMgICAgICAgICAgICAgICAg
fCAgMiArLQo+ICA0OCBmaWxlcyBjaGFuZ2VkLCAxMzEgaW5zZXJ0aW9ucygrKSwgNTIgZGVsZXRp
b25zKC0pCj4gCgouLi4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hL3RpL2szLXVkbWEuYyBi
L2RyaXZlcnMvZG1hL3RpL2szLXVkbWEuYwo+IGluZGV4IDk2YWQyMTg2OWJhNy4uNTBhNGM4ZjA5
OTNkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZG1hL3RpL2szLXVkbWEuYwo+ICsrKyBiL2RyaXZl
cnMvZG1hL3RpL2szLXVkbWEuYwo+IEBAIC01MTg4LDcgKzUxODgsNyBAQCBzdGF0aWMgaW50IHVk
bWFfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCXVkLT5tYXRjaF9kYXRh
ID0gbWF0Y2gtPmRhdGE7Cj4gIAo+ICAJc29jID0gc29jX2RldmljZV9tYXRjaChrM19zb2NfZGV2
aWNlcyk7Cj4gLQlpZiAoIXNvYykgewo+ICsJaWYgKCFJU19FUlIoc29jKSAmJiAhc29jKSB7Cgp0
aGlzIGRvZXMgbm90IHNvdW5kIHJpZ2h0Li4uCgppZiAoIXNvYyB8fCBJU19FUlIoc29jKSkKb3IK
aWYgKElTX0VSUl9PUl9OVUxMKHNvYykpCmlzIGV2ZW4gYmV0dGVyLgoKPiAgCQlkZXZfZXJyKGRl
diwgIk5vIGNvbXBhdGlibGUgU29DIGZvdW5kXG4iKTsKPiAgCQlyZXR1cm4gLUVOT0RFVjsKClRo
ZXJlIG1pZ2h0IGJlIGEgY2xldmVyIG1hY3JvIGZvciBpdCwgYnV0OgoKcmV0dXJuIHNvYyA/IFBU
Ul9FUlIoc29jKSA6IC1FTk9ERVY7Cgo+ICAJfQoKLS0gClDDqXRlcgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
