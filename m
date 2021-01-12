Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0E8C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 23:10:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5940123123
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 23:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5940123123
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I2r6h6E67mJ9CBuk6grS9fAC9IjrzFTpEtriqbpGhD0=; b=kvsgpyCNy9XOlPzWNcPThq7HT
	/92L40Mq/XZWuXUnORhYUthmXY1MOcD6qzGWHTJPEc45yBL1YymBqA5nijOUXVzqw2CYP4mDEIV4q
	nXxx/lG4HQj4B0JrkW5w9AhMESCzLjKEQGnuYQcZmY2i6iEUoCoM3jxJO41rg0eKRW3JCWDeMX09A
	cKDMA7p/qWNPnDs3WFE0xFJeDTr+5adWMVIFX+VTqRN1THNZo4BFNtUH9FFnPK4VOg04fQH7bUHlZ
	kg6XxnUjTAq285LOa9J76HTVNzPzUNC7paI3zlp9k732TajiblLRbQxel/6Ydl+nanY9VTS+bVrYw
	8nZB9n0eg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzSnb-00041H-OO; Tue, 12 Jan 2021 23:10:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzSnS-0003x5-MZ; Tue, 12 Jan 2021 23:09:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6865F23131;
 Tue, 12 Jan 2021 23:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610492992;
 bh=0nyABi1I6IbH4taoMU8LdjyQhHLxaseiMU9/vMX1KR0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sbovZzbeFJgifUDQV6OfTlsFv8x0Syu8Dw9ldR+eHROYAH3KszT1DYse3BzCKeJsr
 qWwvJ4VIjMg8HUHrO0AAdrRf+FH9vjPcfdb4HZC46HRKpCMXwNdSlKBA31R6NI2RFo
 xebqqRHLQkJaOSKXIbCCutgSfCM+9vcHQ8KXdiwtpKYouZSImcEtubsYRR3ytFsRV/
 M2Hc3yd/tUMbmExxC4tUogz6aNe5nOlsscWpP4/gjsKnR3CwS0+W0RWcbEolWJt6/d
 2eokurBSDvsK/xWbxSnpSlaIEjym1JZxskxtgE9K7G2Qtmw3PH4F3PvLwwGlWQxQMt
 5raltDROxOfrg==
Received: by mail-ej1-f44.google.com with SMTP id lt17so386355ejb.3;
 Tue, 12 Jan 2021 15:09:52 -0800 (PST)
X-Gm-Message-State: AOAM533vNGzvMZsgTaYG0ffdcRTpDlQ9KvRqqHEnGx144Igk5qVAGNEF
 ttoxyBFRRASJDP5qReEWm+0GkflTADemyL8ijQ==
X-Google-Smtp-Source: ABdhPJwP64jmhjn4D+dF85A/6b6TbFHN8xXLISjTvjsyFKbBPrJtBOL7OecdSuy90tRVPSF9pUMEob05jWopgh4yEjg=
X-Received: by 2002:a17:906:fb1a:: with SMTP id
 lz26mr791422ejb.194.1610492990879; 
 Tue, 12 Jan 2021 15:09:50 -0800 (PST)
MIME-Version: 1.0
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-10-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1610351031-21133-10-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 13 Jan 2021 07:09:39 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8qDAy=hmbuyxuJTqp3nG_ZqiYHpP0fp4C5Zvs4tKeoNA@mail.gmail.com>
Message-ID: <CAAOTY_8qDAy=hmbuyxuJTqp3nG_ZqiYHpP0fp4C5Zvs4tKeoNA@mail.gmail.com>
Subject: Re: [PATCH v3, 09/15] drm/mediatek: Add pm runtime support for gamma
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_180954_960072_394CDBFB 
X-CRM114-Status: GOOD (  18.56  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 CK Hu <ck.hu@mediatek.com>, Yidi Lin <yidi.lin@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDHmnIgxMeaXpSDpgLHkuIAg5LiL5Y2IMzo0OOWvq+mBk++8mgoKPgo+IGdh
bW1hIHBvd2VyIGRvbWFpbiBuZWVkIGNvbnRyb2xlZCBpbiB0aGUgZGV2aWNlLgoKSW4gdGhpcyBz
ZXJpZXMsIHdoeSBvbmx5IGdhbW1hIGFuZCBjb2xvciBhZGQgcG0gcnVudGltZSBzdXBwb3J0PyBJ
CnRoaW5rIGFsbCBkZHAgY29tcG9uZW50IG5lZWQgcG0gcnVudGltZSBzdXBwb3J0LiBBbmQgcG0g
cnVudGltZQpzdXBwb3J0IGlzIG5vdCByZWxhdGVkIHRvIG10ODE5Miwgc28gbW92ZSB0aGVzZSBw
YXRjaGVzIG91dCBvZiB0aGlzCnNlcmllcy4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gU2ln
bmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogWWlkaSBMaW4gPHlpZGkubGluQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2dhbW1hLmMgfCA1ICsrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZ2FtbWEuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZGlzcF9nYW1tYS5jCj4gaW5kZXggM2MxZWEwNy4uZGE5MzA3OSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZ2FtbWEuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9nYW1tYS5jCj4gQEAgLTEwLDYgKzEwLDcgQEAK
PiAgI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvb2ZfaXJx
Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiArI2luY2x1ZGUgPGxp
bnV4L3BtX3J1bnRpbWUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NvYy9tZWRpYXRlay9tdGstY21k
cS5oPgo+Cj4gICNpbmNsdWRlICJtdGtfZHJtX2NydGMuaCIKPiBAQCAtMTU2LDYgKzE1Nyw4IEBA
IHN0YXRpYyBpbnQgbXRrX2Rpc3BfZ2FtbWFfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPgo+ICAgICAgICAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgcHJpdik7Cj4KPiAr
ICAgICAgIHBtX3J1bnRpbWVfZW5hYmxlKGRldik7Cj4gKwo+ICAgICAgICAgcmV0ID0gY29tcG9u
ZW50X2FkZChkZXYsICZtdGtfZGlzcF9nYW1tYV9jb21wb25lbnRfb3BzKTsKPiAgICAgICAgIGlm
IChyZXQpCj4gICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGFkZCBjb21w
b25lbnQ6ICVkXG4iLCByZXQpOwo+IEBAIC0xNjUsNiArMTY4LDggQEAgc3RhdGljIGludCBtdGtf
ZGlzcF9nYW1tYV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+Cj4gIHN0YXRp
YyBpbnQgbXRrX2Rpc3BfZ2FtbWFfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4gIHsKPiArICAgICAgIHBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsKPiArCj4gICAg
ICAgICBjb21wb25lbnRfZGVsKCZwZGV2LT5kZXYsICZtdGtfZGlzcF9nYW1tYV9jb21wb25lbnRf
b3BzKTsKPgo+ICAgICAgICAgcmV0dXJuIDA7Cj4gLS0KPiAxLjguMS4xLmRpcnR5Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
