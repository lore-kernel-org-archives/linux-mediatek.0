Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4272C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 06:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NaKcdFcA6p7SKbVHdkzkXReww9ePv9FEtiNtjK30rG4=; b=WMZaQEx4e4oLbV
	dTSOmoGiP12f1OzKvotbms6n5cllwgmm79NUeBx9ZOlVtbZBMCdMnv34pLrpgKCSvIDgI5OQ0UNk7
	MQPa2/uKUdzhp4lutJj0AC/kZFyjuXxlpy0RKPd0k+lF+fKkZFbl1GXtv1vhvkyNlPHTyAyUDuiW/
	QtFzbefwp5H3UtgWyJOyGw/GTVfJcYuuvMitfp15kAYSPQ9QRNnUrg9h4sdtUDiTRC/TjhUKfwitK
	tHaW9UjIE95EeZupRHWjcaHneIowJGCLSakdU9QRz9ZSVjsoGWg3yujfWJwl7wysck7H/UmOthAO5
	TZjzgKFnPNJ9T7J6ixEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np2cv-00AZna-QO; Thu, 12 May 2022 06:48:45 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np2cj-00AZiQ-Eh; Thu, 12 May 2022 06:48:35 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F3A0A1F8F4;
 Thu, 12 May 2022 06:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652338105; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eu9dmL37+61LEqPwl8A52yyx9mTfxqzqsNTK2LFvPLQ=;
 b=GINM0xc9jq+k+Rm9dfJBpBb5b9xYd3NSyOFAAM1GqUZofWwqRW0xafLC2TRExNkREM8Cs6
 tp/EaLSZs6qv9kdrKhLQwbLEBA4vkkcJiDOXnWZaRutFi0aM46eUBxJhHOXFEuzyd9SfaH
 2JjjJoGuXX8RinzI5mrEB/Aj3Q/RLZ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652338105;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eu9dmL37+61LEqPwl8A52yyx9mTfxqzqsNTK2LFvPLQ=;
 b=OZM1ZcPj2bCc+as8UglJ1d7CTen0JK3v7tACdsnA71o+G83xWyJcNR4pz+ISE12LF5OYqK
 Li91Qrr6y7QZjzBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B51A013ABE;
 Thu, 12 May 2022 06:48:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iagnKritfGLoVQAAMHmgww
 (envelope-from <hare@suse.de>); Thu, 12 May 2022 06:48:24 +0000
Message-ID: <1e349868-b302-1473-188a-1a6f2bb88cd5@suse.de>
Date: Thu, 12 May 2022 08:48:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220511231810.4928-1-Sergey.Semin@baikalelectronics.ru>
 <20220511231810.4928-11-Sergey.Semin@baikalelectronics.ru>
From: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v3 10/23] ata: libahci_platform: Parse ports-implemented
 property in resources getter
In-Reply-To: <20220511231810.4928-11-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_234833_677708_9B8B5BFD 
X-CRM114-Status: GOOD (  21.47  )
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

T24gNS8xMi8yMiAwMToxNywgU2VyZ2UgU2VtaW4gd3JvdGU6Cj4gVGhlIHBvcnRzLWltcGxlbWVu
dGVkIHByb3BlcnR5IGlzIG1haW5seSB1c2VkIG9uIHRoZSBPRi1iYXNlZCBwbGF0Zm9ybXMKPiB3
aXRoIG5vIHBvcnRzIG1hcHBpbmcgaW5pdGlhbGl6ZWQgYnkgYSBib290bG9hZGVyL0JJT1MgZmly
bXdhcmUuIFNlZWluZwo+IHRoZSBzYW1lIG9mX3Byb3BlcnR5X3JlYWRfdTMyKCktYmFzZWQgcGF0
dGVybiBoYXMgYWxyZWFkeSBiZWVuIGltcGxlbWVudGVkCj4gaW4gdGhlIGdlbmVyaWMgQUhDSSBM
TEREIChnbHVlKSBkcml2ZXIgYW5kIGluIHRoZSBNZWRpYXRlaywgU3QgQUhDSQo+IGRyaXZlcnMg
bGV0J3MgbW92ZSB0aGUgcHJvcGVydHkgcmVhZCBwcm9jZWR1cmUgdG8gdGhlIGdlbmVyaWMKPiBh
aGNpX3BsYXRmb3JtX2dldF9yZXNvdXJjZXMoKSBtZXRob2QuIFRodXMgd2UnbGwgaGF2ZSB0aGUg
Zm9yY2VkIHBvcnRzCj4gbWFwcGluZyBmZWF0dXJlIHN1cHBvcnRlZCBmb3IgZWFjaCBPRi1iYXNl
ZCBwbGF0Zm9ybSB3aGljaCByZXF1aXJlcyB0aGF0LAo+IGFuZCBzdG9wIHJlLWltcGxlbWVudGlu
ZyB0aGUgc2FtZSBwYXR0ZXJuIGluIHRoZXJlIGEgYml0IHNpbXBsaWZ5aW5nIHRoZQo+IGNvZGUu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogU2VyZ2UgU2VtaW4gPFNlcmdleS5TZW1pbkBiYWlrYWxlbGVj
dHJvbmljcy5ydT4KPiAtLS0KPiAgIGRyaXZlcnMvYXRhL2FoY2lfbXRrLmMgICAgICAgICB8IDIg
LS0KPiAgIGRyaXZlcnMvYXRhL2FoY2lfcGxhdGZvcm0uYyAgICB8IDMgLS0tCj4gICBkcml2ZXJz
L2F0YS9haGNpX3N0LmMgICAgICAgICAgfCAzIC0tLQo+ICAgZHJpdmVycy9hdGEvbGliYWhjaV9w
bGF0Zm9ybS5jIHwgMyArKysKPiAgIDQgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2F0YS9haGNpX210ay5jIGIv
ZHJpdmVycy9hdGEvYWhjaV9tdGsuYwo+IGluZGV4IDFmNmM4NWZkZTk4My4uYzA1NjM3OGUzZTcy
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYXRhL2FoY2lfbXRrLmMKPiArKysgYi9kcml2ZXJzL2F0
YS9haGNpX210ay5jCj4gQEAgLTExOCw4ICsxMTgsNiBAQCBzdGF0aWMgaW50IG10a19haGNpX3Bh
cnNlX3Byb3BlcnR5KHN0cnVjdCBhaGNpX2hvc3RfcHJpdiAqaHByaXYsCj4gICAJCQkJICAgU1lT
X0NGR19TQVRBX0VOKTsKPiAgIAl9Cj4gICAKPiAtCW9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAi
cG9ydHMtaW1wbGVtZW50ZWQiLCAmaHByaXYtPmZvcmNlX3BvcnRfbWFwKTsKPiAtCj4gICAJcmV0
dXJuIDA7Cj4gICB9Cj4gICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9hdGEvYWhjaV9wbGF0Zm9y
bS5jIGIvZHJpdmVycy9hdGEvYWhjaV9wbGF0Zm9ybS5jCj4gaW5kZXggMjhhOGRlNWI0OGI5Li45
YjU2NDkwZWNiYzMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9hdGEvYWhjaV9wbGF0Zm9ybS5jCj4g
KysrIGIvZHJpdmVycy9hdGEvYWhjaV9wbGF0Zm9ybS5jCj4gQEAgLTU2LDkgKzU2LDYgQEAgc3Rh
dGljIGludCBhaGNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAJaWYg
KHJjKQo+ICAgCQlyZXR1cm4gcmM7Cj4gICAKPiAtCW9mX3Byb3BlcnR5X3JlYWRfdTMyKGRldi0+
b2Zfbm9kZSwKPiAtCQkJICAgICAicG9ydHMtaW1wbGVtZW50ZWQiLCAmaHByaXYtPmZvcmNlX3Bv
cnRfbWFwKTsKPiAtCj4gICAJaWYgKG9mX2RldmljZV9pc19jb21wYXRpYmxlKGRldi0+b2Zfbm9k
ZSwgImhpc2lsaWNvbixoaXNpLWFoY2kiKSkKPiAgIAkJaHByaXYtPmZsYWdzIHw9IEFIQ0lfSEZM
QUdfTk9fRkJTIHwgQUhDSV9IRkxBR19OT19OQ1E7Cj4gICAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9hdGEvYWhjaV9zdC5jIGIvZHJpdmVycy9hdGEvYWhjaV9zdC5jCj4gaW5kZXggNzUyNjY1M2M4
NDNiLi4wNjg2MjEwOTljMDAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9hdGEvYWhjaV9zdC5jCj4g
KysrIGIvZHJpdmVycy9hdGEvYWhjaV9zdC5jCj4gQEAgLTE2OCw5ICsxNjgsNiBAQCBzdGF0aWMg
aW50IHN0X2FoY2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgIAo+ICAg
CXN0X2FoY2lfY29uZmlndXJlX29vYihocHJpdi0+bW1pbyk7Cj4gICAKPiAtCW9mX3Byb3BlcnR5
X3JlYWRfdTMyKGRldi0+b2Zfbm9kZSwKPiAtCQkJICAgICAicG9ydHMtaW1wbGVtZW50ZWQiLCAm
aHByaXYtPmZvcmNlX3BvcnRfbWFwKTsKPiAtCj4gICAJZXJyID0gYWhjaV9wbGF0Zm9ybV9pbml0
X2hvc3QocGRldiwgaHByaXYsICZzdF9haGNpX3BvcnRfaW5mbywKPiAgIAkJCQkgICAgICAmYWhj
aV9wbGF0Zm9ybV9zaHQpOwo+ICAgCWlmIChlcnIpIHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9h
dGEvbGliYWhjaV9wbGF0Zm9ybS5jIGIvZHJpdmVycy9hdGEvbGliYWhjaV9wbGF0Zm9ybS5jCj4g
aW5kZXggNGU1NGUxOWYwN2IyLi5mN2Y5Y2FjMTBjYjEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9h
dGEvbGliYWhjaV9wbGF0Zm9ybS5jCj4gKysrIGIvZHJpdmVycy9hdGEvbGliYWhjaV9wbGF0Zm9y
bS5jCj4gQEAgLTUxMiw2ICs1MTIsOSBAQCBzdHJ1Y3QgYWhjaV9ob3N0X3ByaXYgKmFoY2lfcGxh
dGZvcm1fZ2V0X3Jlc291cmNlcyhzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+ICAgCQln
b3RvIGVycl9vdXQ7Cj4gICAJfQo+ICAgCj4gKwlvZl9wcm9wZXJ0eV9yZWFkX3UzMihkZXYtPm9m
X25vZGUsCj4gKwkJCSAgICAgInBvcnRzLWltcGxlbWVudGVkIiwgJmhwcml2LT5mb3JjZV9wb3J0
X21hcCk7Cj4gKwo+ICAgCWlmIChjaGlsZF9ub2Rlcykgewo+ICAgCQlmb3JfZWFjaF9jaGlsZF9v
Zl9ub2RlKGRldi0+b2Zfbm9kZSwgY2hpbGQpIHsKPiAgIAkJCXUzMiBwb3J0OwoKV2hhdCBoYXBw
ZW5zIG9uIHRoZSBvdGhlciBwbGF0Zm9ybXM/Cldvbid0IHRoZXkgcmVnaXN0ZXIgYW4gZXJyb3Ig
aWYgdGhhdCBwcm9wZXJ0eSBpc24ndCBpbXBsZW1lbnRlZD8KCkNoZWVycywKCkhhbm5lcwotLSAK
RHIuIEhhbm5lcyBSZWluZWNrZQkJICAgICAgICAgICBLZXJuZWwgU3RvcmFnZSBBcmNoaXRlY3QK
aGFyZUBzdXNlLmRlCQkJICAgICAgICAgICAgICAgICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcKSFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHRjogRmVsaXggSW1lbmTDtnJmZmVyCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
