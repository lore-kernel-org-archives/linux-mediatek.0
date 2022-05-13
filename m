Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89BBC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 07:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OZy2+dOS+qSVtDYvl9LqRiHqAkgKPTJxFH1iewwjocI=; b=JwjybPfk3Et7oM
	Ai0r227hoMxmaUYDjoz+ZN9HFt6qrstbOrLml7qCczyVoFtqDPyzdCb7Vua521FQ2zrcus91MqGww
	kOZbN30080c9FBjCDYwo2/IAEehlpSZkRfOWIdHZPicwfryAKCFwFDaK0mKSL2GpM30JpeN7DrJ6K
	Gd7SU7UWXgQ2YLmwGZ4iocIwPEyOC12Vy9g76At0vEiAXQHExv/xSsG3XuGZH0kzK1oZBnAdOSM4i
	gg/6c0/rKsU+54EGIjDxeYmMONaZAMRSfNyIfAYNerewB+UlOr7oTGVRDLLGDXWCyoXhXrRTompZ4
	VZCDq+7TJP+Vl1/G6fpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npPwj-00Eslb-Dh; Fri, 13 May 2022 07:42:45 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npPwg-00Esk8-6H; Fri, 13 May 2022 07:42:43 +0000
Received: by mail-wr1-x42f.google.com with SMTP id e29so619103wrc.11;
 Fri, 13 May 2022 00:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=h4Eoh4lUanKYZL6m5WR756e9/uQNhRUTKgBep3AgcuQ=;
 b=OogmQrJbyJkdkJDDl0/KVR6lUqZEjYU6qz49Nd7B50AXo1s3Y3Ogp48dsrFTRT54lB
 Jvmh6yAJui5uS6wKlEoMFwli7jhmuAOaBwB2Osmu0J5OS76JN580XKcwsbjdzS1Q4AMq
 1Gv/m9z+3ogePGRnEelhXr6BD3XlyU7DjFRU7Mm2ZzIvky5mXWcZFIyglTEUHB7wZQNS
 gf8UZY+xlp2VmontV7mWk3qm/SnxQQmWmlKzbx8YEkO5a3/g65SY4cCIE3Spvz5VsSSp
 vy++TZhpgNaShJNffmWSgbtS6mFkEgGUoqXcWmQPfqCwUznvgpQMK7ZvlPTuVIZDbGGD
 e04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h4Eoh4lUanKYZL6m5WR756e9/uQNhRUTKgBep3AgcuQ=;
 b=nRve47LXRmnvoeJ+fzDfL8OsY3xnQByFLrwmpfrmhEF+6vCR38jgixq7Q8zM3YJpJ+
 YSfJPTvl8efaOnWLb2QceQ0iwaB/KOth8DYWVgPesp2Kp8pFI6jXolCy7ANPwpS4D2Gc
 yLbdMjutocaP1uV2WhnDDipeDUgd36pAp5GW9xQsG13VEm+onPM+adAHO+9xxPMLEl92
 cvoap+qeELPkNl5BPCTZ6K1l7PrpbUELWb31AJuKtakLNKEr7uC7N8LJag7hHK4N4wKi
 lqXguk1Z5xAfzsj8B8xR61RmJsw6Kk/qbo9d5DQu/UDHvi6mewPk4a//bVHy3zNr76wz
 LJ6A==
X-Gm-Message-State: AOAM5338N2cUVWV2B8yfF3Svv0rv6rWOloUtZ9nOD6PqDCj6mvGVaSni
 ubhRxSqdfYxQH5xJVQdsUs4=
X-Google-Smtp-Source: ABdhPJwwCL/Pxk8fkx+VxRZaxLIQFVPV/lfg/6rnAxvVEHihbxXjNAETy7pfrcZgSH4t7ZBGhpeDVQ==
X-Received: by 2002:a05:6000:18a4:b0:20c:5603:c0bf with SMTP id
 b4-20020a05600018a400b0020c5603c0bfmr2695184wri.145.1652427757703; 
 Fri, 13 May 2022 00:42:37 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 t1-20020adfa2c1000000b0020c5253d8d2sm1462382wra.30.2022.05.13.00.42.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 00:42:36 -0700 (PDT)
Message-ID: <623fb170-b59a-84a0-3826-4b78968924bc@gmail.com>
Date: Fri, 13 May 2022 09:42:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v20 8/8] soc: mediatek: remove DDP_DOMPONENT_DITHER from
 enum
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, DTML <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20220419094143.9561-1-jason-jh.lin@mediatek.com>
 <20220419094143.9561-9-jason-jh.lin@mediatek.com>
 <402f0e60-8d3c-850d-84ff-af5424b72b73@gmail.com>
 <CAAOTY_-jiX_BhaZ5+skRu4RSZLjcHJerVtwH34fz4N6_jbVK0w@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAAOTY_-jiX_BhaZ5+skRu4RSZLjcHJerVtwH34fz4N6_jbVK0w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_004242_268044_119AC71C 
X-CRM114-Status: GOOD (  17.44  )
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

SGkgQ2h1bi1LdWFuZywKCk9uIDAyLzA1LzIwMjIgMDA6NTQsIENodW4tS3VhbmcgSHUgd3JvdGU6
Cj4gSGksIE1hdHRoaWFzOgo+IAo+IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFp
bC5jb20+IOaWvCAyMDIy5bm0NOaciDIy5pelIOmAseS6lCDkuIvljYg4OjQy5a+r6YGT77yaCj4+
Cj4+Cj4+Cj4+IE9uIDE5LzA0LzIwMjIgMTE6NDEsIGphc29uLWpoLmxpbiB3cm90ZToKPj4+IEFm
dGVyIG1tc3lzIGFuZCBkcm0gY2hhbmdlIERJVEhFUiBlbnVtIHRvIEREUF9DT01QT05FTlRfRElU
SEVSMCwKPj4+IG1tc3lzIGhlYWRlciBjYW4gcmVtb3ZlIHRoZSB1c2VsZXNzIEREUF9DT01QT05F
TlRfRElUSEVSIGVudW0uCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogamFzb24tamgubGluIDxqYXNv
bi1qaC5saW5AbWVkaWF0ZWsuY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8g
RGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+Cj4+Cj4+
IEFja2VkLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPgo+Pgo+
PiBDaHVuLUt1YW5nLCBJIHRoaW5rIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gdGFrZSB0aGF0IHRo
cm91Z2ggeW91ciB0cmVlIGFzIGl0Cj4+IGRlcGVuZHMgb24gdGhlIHByZXZpb3VzIHBhdGNoZXMu
Cj4+Cj4+IEkgcHJvdmlkZSB5b3UgYSBzdGFibGUgdGFnIHNvIHRoYXQgeW91IGNhbiB0YWtlIGl0
Ogo+PiB2NS4xOC1uZXh0LXZkc28wLXN0YWJsZS10YWcKPiAKPiBBZnRlciBJIHRha2UgdGhpcyB0
YWcsIEkgZmluZCBvbmUgY2hlY2twYXRjaCB3YXJuaW5nOgo+IAo+IFdBUk5JTkc6IERUIGNvbXBh
dGlibGUgc3RyaW5nICJtZWRpYXRlayxtdDgxOTUtbW1zeXMiIGFwcGVhcnMKPiB1bi1kb2N1bWVu
dGVkIC0tIGNoZWNrIC4vRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzLwo+ICM2NzA6
IEZJTEU6IGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jOjM5MDoKPiArICAgICAgICAg
ICAgICAgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LW1tc3lzIiwKPiAKPiBJIHRoaW5r
IHRoaXMgdGFnIGxvc3Qgb25lIGJpbmRpbmcgcGF0Y2gsIGl0J3MgYmV0dGVyIHRoYXQgdGhpcyB0
YWcgaGFzCj4gbm8gdGhpcyB3YXJuaW5nLgo+IAoKU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5IEkg
d2FzIHNpY2suClRoZSB3YXJuaW5nIGlzLCBiZWNhdXNlIHRoZSBzdGFibGUgYnJhbmNoIG1pc3Nl
cyBjb21taXQ6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L21hdHRoaWFzLmJnZy9saW51eC5naXQvY29tbWl0Lz9oPXY1LjE4LW5leHQvc29jJmlkPTgxYzVh
NDFkMTBiOTY4ZWE4OWQ1ZjQ0ZmUxZTVjMmZjNzAyODkyMDkKClNvIGl0J3Mgbm90IGEgcmVhbCBp
c3N1ZSBhbmQgd2lsbCBnbyBhd2F5IG9uY2Ugb3VyIGJyYW5jaGVzIGxhbmQgaW4gdXBzdHJlYW0u
CklzIGl0IE9LIGZvciB5b3UgdG8gaWdub3JlIHRoZSBpc3N1ZT8KClJlZ2FyZHMsCk1hdHRoaWFz
Cgo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFuZy4KPiAKPj4KPj4gUmVnYXJkcywKPj4gTWF0dGhpYXMK
Pj4KPj4+IC0tLQo+Pj4gICAgaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgg
fCAzICstLQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9u
cygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGst
bW1zeXMuaCBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oCj4+PiBpbmRl
eCA1OTExN2Q5NzBkYWYuLmZiNzE5ZmQxMjgxYyAxMDA2NDQKPj4+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oCj4+PiArKysgYi9pbmNsdWRlL2xpbnV4L3NvYy9t
ZWRpYXRlay9tdGstbW1zeXMuaAo+Pj4gQEAgLTE2LDggKzE2LDcgQEAgZW51bSBtdGtfZGRwX2Nv
bXBfaWQgewo+Pj4gICAgICAgIEREUF9DT01QT05FTlRfQ0NPUlIsCj4+PiAgICAgICAgRERQX0NP
TVBPTkVOVF9DT0xPUjAsCj4+PiAgICAgICAgRERQX0NPTVBPTkVOVF9DT0xPUjEsCj4+PiAtICAg
ICBERFBfQ09NUE9ORU5UX0RJVEhFUiwKPj4+IC0gICAgIEREUF9DT01QT05FTlRfRElUSEVSMCA9
IEREUF9DT01QT05FTlRfRElUSEVSLAo+Pj4gKyAgICAgRERQX0NPTVBPTkVOVF9ESVRIRVIwLAo+
Pj4gICAgICAgIEREUF9DT01QT05FTlRfRElUSEVSMSwKPj4+ICAgICAgICBERFBfQ09NUE9ORU5U
X0RQX0lOVEYwLAo+Pj4gICAgICAgIEREUF9DT01QT05FTlRfRFBfSU5URjEsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
