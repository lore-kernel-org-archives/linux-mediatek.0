Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6461AC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 May 2022 09:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YS7pZ48UPoEigVjEDxygmIiuvwTxLYj5zk+402RqPyk=; b=PyaZNQEw0gm4NK
	Gjy2+H/xZzz+JbjCkjHj4YlMG9hk1r40+RjUgv7lxHsmO6axG7RW60pzGrkbatWhdC2e9GeBKjwhH
	nQBs9E6x1pkUaMrSFzPlDKVkrBg0m4MUb1uycYPh5fGs/ivKY/NQ1u2hSP1quTkWaU8E0EhU9f4Ke
	tGYwDtYHquG1UE2rbZ9va+C2n5nXVzlClopUIRbqyZGdFWf54b07OPRIDCmN3CE+IlO0JFFYsAa4l
	gNjpD6haX098oceEUyg950yBH1EyhO45a6JJPFsC7vnK5C2sIGYe6WKJH5AvQw4Q215vNRePBe3A5
	4Q74iTF5ruuaROjYXcSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nusaM-001p1B-8L; Sat, 28 May 2022 09:18:14 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nusaI-001ozI-TC; Sat, 28 May 2022 09:18:12 +0000
Received: by mail-lj1-x22b.google.com with SMTP id m11so7132532ljc.1;
        Sat, 28 May 2022 02:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HVRfiub+OH+3yERsymAq7YJAzta8XBR77uv0v0VV0CI=;
        b=emBIciAFdQnHcKQSohgcuqMQM4xd/Tz5hPJWkxKaoqpZiunJ9s/OTs4WGMG95NSW4L
         IgZczc+9GJXxJcHaJPXn5wGWSwvNNr7NK0iPiKDna7ZgvHSU3H+3cqKDq++bLMIID/pg
         WGi2IGkojhYGQUTThKK+rMJIPdLBixIvgKrHxkmswTwOqRnEJD7L5yQqGEaEOrvK5lk+
         qkpbzv53N91WJdtTRf68St7YDzO4K7K4CZ379sj7xnW+IFrVVRAmkaJKxBPwkYKBzJkg
         l3Y5YpoNbKupcj3Ag1FqEF0wqmBD5ctEDUT8y+jgldf7YfuRmpnjc1XtWB+r4HJU6Val
         yWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HVRfiub+OH+3yERsymAq7YJAzta8XBR77uv0v0VV0CI=;
        b=G7wU0TuKiCaTY66XQyRNXJuW+UlHRNFl6TqFf2qJbg2qtAIYO+ZShmteIHY9jB50JG
         3cDDzMe+eAYNf4AmA+/amXBSYxL+5FAl6UQfbrYBEfGkMMUW0XXiCf7lULrHlRaRtCPm
         rNjZiD/NPuGtt4bObxMgUIweAtaSH5iMS6P3lzDosnShxnq8CutGZtC9o4RfGmR/Fphp
         d2qcl3AAIUSW9LzLrL85MKrFBkjU/eVKegp4bRywQfxc7GEcw3+740RAL/5zIe/pC71J
         S56ZY2Y3q2azQdnh+s6KKQ6CRhqC71PaW+W7D8ZIIasuSC1XsI4xqNXihLUhJVteAJMy
         FtVA==
X-Gm-Message-State: AOAM533g/Qhhr3hpaO3wW0YwWIxAuU1x5ZkS40dc8K/4etFehT/cxB8r
	jZwXAXSqRS5AOVZaxY7EUIs+UAzzjigqNTVF
X-Google-Smtp-Source: ABdhPJxNkzG4eousUKAj15zHH6g3YqSnU9H8B29bmyYBmgxkfeUg1JCXHoHxE95njq7TczFOLpZl7Q==
X-Received: by 2002:a2e:a5ca:0:b0:253:c604:647c with SMTP id n10-20020a2ea5ca000000b00253c604647cmr27577549ljp.403.1653729487689;
        Sat, 28 May 2022 02:18:07 -0700 (PDT)
Received: from [10.0.0.127] (91-159-150-230.elisa-laajakaista.fi. [91.159.150.230])
        by smtp.gmail.com with ESMTPSA id v9-20020a2ea449000000b0024f3d1daee2sm1402828ljn.106.2022.05.28.02.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 May 2022 02:18:07 -0700 (PDT)
Message-ID: <454f31e4-12ce-2bee-8e95-d75854b34380@gmail.com>
Date: Sat, 28 May 2022 12:19:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 52/56] ASoC: ti: Rename set_fmt_new back to set_fmt
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com,
 nicolas.ferre@microchip.com, nsaenz@kernel.org, shawnguo@kernel.org,
 linux-imx@nxp.com, cezary.rojewski@intel.com,
 pierre-louis.bossart@linux.intel.com, linux-mips@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 daniel@zonque.org, srinivas.kandagatla@linaro.org,
 linux-rockchip@lists.infradead.org, krzk@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, jarkko.nikula@bitmer.com, heiko@sntech.de,
 jbrunet@baylibre.com, kernel@pengutronix.de, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-53-ckeepax@opensource.cirrus.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20220519154318.2153729-53-ckeepax@opensource.cirrus.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220528_021810_987473_DE881111 
X-CRM114-Status: GOOD (  13.35  )
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

CgpPbiAxOS8wNS8yMDIyIDE4OjQzLCBDaGFybGVzIEtlZXBheCB3cm90ZToKPiBOb3cgdGhlIGNv
cmUgaGFzIGJlZW4gbWlncmF0ZWQgYWNyb3NzIHRvIHRoZSBuZXcgZGlyZWN0IGNsb2NrCj4gc3Bl
Y2lmaWNhdGlvbiB3ZSBjYW4gbW92ZSB0aGUgZHJpdmVycyBiYWNrIHRvIHRoZSBub3JtYWwgc2V0
X2ZtdAo+IGNhbGxiYWNrLgoKQWNrZWQtYnk6IFBldGVyIFVqZmFsdXNpIDxwZXRlci51amZhbHVz
aUBnbWFpbC5jb20+Cgo+IFNpZ25lZC1vZmYtYnk6IENoYXJsZXMgS2VlcGF4IDxja2VlcGF4QG9w
ZW5zb3VyY2UuY2lycnVzLmNvbT4KPiAtLS0KPiAgc291bmQvc29jL3RpL2RhdmluY2ktaTJzLmMg
ICB8IDIgKy0KPiAgc291bmQvc29jL3RpL2RhdmluY2ktbWNhc3AuYyB8IDIgKy0KPiAgc291bmQv
c29jL3RpL29tYXAtbWNic3AuYyAgICB8IDIgKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy90aS9k
YXZpbmNpLWkycy5jIGIvc291bmQvc29jL3RpL2RhdmluY2ktaTJzLmMKPiBpbmRleCBjNzM2OGQ1
Mjk2Njg4Li5mZTU3MmI3MjBiMDk0IDEwMDY0NAo+IC0tLSBhL3NvdW5kL3NvYy90aS9kYXZpbmNp
LWkycy5jCj4gKysrIGIvc291bmQvc29jL3RpL2RhdmluY2ktaTJzLmMKPiBAQCAtNjA2LDcgKzYw
Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYWlfb3BzIGRhdmluY2lfaTJzX2Rh
aV9vcHMgPSB7Cj4gIAkucHJlcGFyZQk9IGRhdmluY2lfaTJzX3ByZXBhcmUsCj4gIAkudHJpZ2dl
cgk9IGRhdmluY2lfaTJzX3RyaWdnZXIsCj4gIAkuaHdfcGFyYW1zCT0gZGF2aW5jaV9pMnNfaHdf
cGFyYW1zLAo+IC0JLnNldF9mbXRfbmV3CT0gZGF2aW5jaV9pMnNfc2V0X2RhaV9mbXQsCj4gKwku
c2V0X2ZtdAk9IGRhdmluY2lfaTJzX3NldF9kYWlfZm10LAo+ICAJLnNldF9jbGtkaXYJPSBkYXZp
bmNpX2kyc19kYWlfc2V0X2Nsa2RpdiwKPiAgCj4gIH07Cj4gZGlmZiAtLWdpdCBhL3NvdW5kL3Nv
Yy90aS9kYXZpbmNpLW1jYXNwLmMgYi9zb3VuZC9zb2MvdGkvZGF2aW5jaS1tY2FzcC5jCj4gaW5k
ZXggOTYxYmFjNjk2MzY1Mi4uZTJhYWI0NzI5ZjNhYiAxMDA2NDQKPiAtLS0gYS9zb3VuZC9zb2Mv
dGkvZGF2aW5jaS1tY2FzcC5jCj4gKysrIGIvc291bmQvc29jL3RpL2RhdmluY2ktbWNhc3AuYwo+
IEBAIC0xNjIwLDcgKzE2MjAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfZGFpX29w
cyBkYXZpbmNpX21jYXNwX2RhaV9vcHMgPSB7Cj4gIAkudHJpZ2dlcgk9IGRhdmluY2lfbWNhc3Bf
dHJpZ2dlciwKPiAgCS5kZWxheQkJPSBkYXZpbmNpX21jYXNwX2RlbGF5LAo+ICAJLmh3X3BhcmFt
cwk9IGRhdmluY2lfbWNhc3BfaHdfcGFyYW1zLAo+IC0JLnNldF9mbXRfbmV3CT0gZGF2aW5jaV9t
Y2FzcF9zZXRfZGFpX2ZtdCwKPiArCS5zZXRfZm10CT0gZGF2aW5jaV9tY2FzcF9zZXRfZGFpX2Zt
dCwKPiAgCS5zZXRfY2xrZGl2CT0gZGF2aW5jaV9tY2FzcF9zZXRfY2xrZGl2LAo+ICAJLnNldF9z
eXNjbGsJPSBkYXZpbmNpX21jYXNwX3NldF9zeXNjbGssCj4gIAkuc2V0X3RkbV9zbG90CT0gZGF2
aW5jaV9tY2FzcF9zZXRfdGRtX3Nsb3QsCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy90aS9vbWFw
LW1jYnNwLmMgYi9zb3VuZC9zb2MvdGkvb21hcC1tY2JzcC5jCj4gaW5kZXggNWJmYjU2ZDRmZjg0
NC4uNThkOGUyMDBhN2I5NyAxMDA2NDQKPiAtLS0gYS9zb3VuZC9zb2MvdGkvb21hcC1tY2JzcC5j
Cj4gKysrIGIvc291bmQvc29jL3RpL29tYXAtbWNic3AuYwo+IEBAIC0xMjcxLDcgKzEyNzEsNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfZGFpX29wcyBtY2JzcF9kYWlfb3BzID0gewo+
ICAJLnRyaWdnZXIJPSBvbWFwX21jYnNwX2RhaV90cmlnZ2VyLAo+ICAJLmRlbGF5CQk9IG9tYXBf
bWNic3BfZGFpX2RlbGF5LAo+ICAJLmh3X3BhcmFtcwk9IG9tYXBfbWNic3BfZGFpX2h3X3BhcmFt
cywKPiAtCS5zZXRfZm10X25ldwk9IG9tYXBfbWNic3BfZGFpX3NldF9kYWlfZm10LAo+ICsJLnNl
dF9mbXQJPSBvbWFwX21jYnNwX2RhaV9zZXRfZGFpX2ZtdCwKPiAgCS5zZXRfY2xrZGl2CT0gb21h
cF9tY2JzcF9kYWlfc2V0X2Nsa2RpdiwKPiAgCS5zZXRfc3lzY2xrCT0gb21hcF9tY2JzcF9kYWlf
c2V0X2RhaV9zeXNjbGssCj4gIH07CgotLSAKUMOpdGVyCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
