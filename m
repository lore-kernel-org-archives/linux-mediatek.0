Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46EE0C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 12:50:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4057611AD
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 12:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4057611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eD0UuFMOKA7w5rKQERG6owR5lktcKLtGcbnztpTV+4o=; b=LhDTWV7eL90Jsfiu7e4qyc6mj
	/wF8U9n2luYt3g3lzJDVZh+XYl5LBMiMvRxfzsLYIEYIjWy3XMOZ+cb3kjtPZgyNTto8iMEBBZe8e
	fDhGxOCjN5vNF2Fc8TXjfmtDUTW2TYhe6Fcqmw6ubQY28il55rns60g81ystRLSsE6C2xitEQn/uh
	WEJC3wpQWj9JpYaxs6sdrx2Ge2LFRLmroREuDyoqE1jkG424AUixhFs9PpdruOaTFrxt+9U66PcYk
	+3GJ8VkQdC+LiYdjeMgiJqzp4dp8I7sm+AmKVayxAoVfjMDU8CFG0oCwaMnAVLfE+MwkyddI8PHIR
	AIqxbIi9w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljLeG-003y3Q-MF; Wed, 19 May 2021 12:50:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljKH1-003kUy-8i; Wed, 19 May 2021 11:22:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=qnfbbYSoXMFDxE4eFfkMJYMcwwl1FwR3Q2cHcnZPUEY=; b=1lAWh8DTI1IaP+pN2IGoFEpKE4
 SylvTR9hkUBA7j32FFAsLMyPIeRYaE3CpaF+NXoB7fQgxSwZSzpCsuJwSh21P29D3LbhnLpM4Ne6Z
 3Z1dd0aJ6WlYowBMTqxZFKNsOMf7pUezcROz+tvszwm+ZxtvYULp6zVjZqaTPmtU4V7TWBPHHGQx0
 cggX3aTPh4jWZgq2PjXsimk53Z6n7qGQUwxoRTv4zrg0k/mkM8GhCUIreEmO3lfpmuGTwjBIxQNzs
 n6w8uK5H+s6nn2M95DRBmZ9+tl5PZ1hiJ/19NZRT7iGUAFX4fHR3jqqgE1YtkWVnl1nCr1o9TTkGe
 h6IIzWgw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljKGy-00FOxe-Cc; Wed, 19 May 2021 11:21:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54B016112F;
 Wed, 19 May 2021 11:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621423314;
 bh=fYglNnaQAuxyqNWH/krc3Hg57khobkxg9ya/DgyJ1RQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q/jAuaSOmf39GSQwhaz77Q8HwKs9NI/MXXDej3zH+ZZ5leN+Gee0CfZC9IdC97cPd
 FJXNA0CLfB6FzKQeHlUQ0bAO8J4/YZb519tX23nQBxTcKyJQ8bSdsF3rzAxc9MvmxP
 A5l+cBlPZy8crrKC/CJsg5BdlNVZurEh3kLiVrXZQccx3DAUUeyUdnPpSO9l5q1q9J
 t8wHD0WuavvnUTn9RALhO1Ws2gViUgrSXj4zzGnFu/YhEvO1ta39iQHxmKORDU72PS
 31geyv09Iits+L0Wjt+u2DrIdNF6S9gDeUCo7quGFs6vITfeZPVXH+oL4vxn4QR6u1
 Yu9NtpFrJ+ABg==
Received: by mail-ed1-f45.google.com with SMTP id df21so14920716edb.3;
 Wed, 19 May 2021 04:21:54 -0700 (PDT)
X-Gm-Message-State: AOAM531v9X8CFzBpTVVPnbqCRcAhS3t607bisu6FDsV4JHrO3h+W2qQh
 +UG9DR0R+nJviB9gwX7zvTG7igtU3FB5iOr51g==
X-Google-Smtp-Source: ABdhPJyhU1VHrUgMaJOH/P0DFczuZUCtXu2r+76ZrF10+WGgIhv+5vQxqqI9hG1DvdaQC+1oa4aSa7YPHzDhOA1Re8U=
X-Received: by 2002:aa7:ccc6:: with SMTP id y6mr388400edt.303.1621423312942;
 Wed, 19 May 2021 04:21:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210314233323.23377-1-chunkuang.hu@kernel.org>
 <20210314233323.23377-2-chunkuang.hu@kernel.org>
In-Reply-To: <20210314233323.23377-2-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 19 May 2021 19:21:42 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8ASVD_kApnRmrrsA6nh3XDYAyS-u0g7jK_GF4KipT=wg@mail.gmail.com>
Message-ID: <CAAOTY_8ASVD_kApnRmrrsA6nh3XDYAyS-u0g7jK_GF4KipT=wg@mail.gmail.com>
Subject: Re: [PATCH 1/3] mailbox: mtk-cmdq: Remove cmdq_cb_status
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_042156_526117_52C16FDC 
X-CRM114-Status: GOOD (  19.30  )
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

SGksIEphc3NpOgoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAy
MDIx5bm0M+aciDE15pelIOmAseS4gCDkuIrljYg3OjMz5a+r6YGT77yaCj4KPiBjbWRxX2NiX3N0
YXR1cyBpcyBhbiBlcnJvciBzdGF0dXMuIFVzZSB0aGUgc3RhbmRhcmQgZXJyb3IgbnVtYmVyCj4g
aW5zdGVhZCBvZiBjbWRxX2NiX3N0YXR1cyB0byBwcmV2ZW50IHN0YXR1cyBkdXBsaWNhdGlvbi4K
CkhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpcyBzZXJpZXM/CgpSZWdhcmRzLApDaHVuLUt1YW5n
LgoKPgo+IENjOiBKYXNzaSBCcmFyIDxqYXNzaXNpbmdoYnJhckBnbWFpbC5jb20+Cj4gQ2M6IE1h
dHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Cj4gQ2M6IEhvdWxvbmcgV2Vp
IDxob3Vsb25nLndlaUBtZWRpYXRlay5jb20+Cj4gQ2M6IEJpYmJ5IEhzaWVoIDxiaWJieS5oc2ll
aEBtZWRpYXRlay5jb20+Cj4gQ2M6IERlbm5pcyBZQyBIc2llaCA8ZGVubmlzLXljLmhzaWVoQG1l
ZGlhdGVrLmNvbT4KPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IFNpZ25lZC1vZmYtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFu
Zy5odUBrZXJuZWwub3JnPgo+IC0tLQo+ICBkcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJv
eC5jICAgICAgIHwgMTAgKysrKystLS0tLQo+ICBpbmNsdWRlL2xpbnV4L21haWxib3gvbXRrLWNt
ZHEtbWFpbGJveC5oIHwgIDcgKy0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgMTEgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tYWlsYm94L210
ay1jbWRxLW1haWxib3guYyBiL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMKPiBp
bmRleCA1NjY1YjZlYTgxMTkuLjNkMzdjMWNkNDBmMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21h
aWxib3gvbXRrLWNtZHEtbWFpbGJveC5jCj4gKysrIGIvZHJpdmVycy9tYWlsYm94L210ay1jbWRx
LW1haWxib3guYwo+IEBAIC0xODAsNyArMTgwLDcgQEAgc3RhdGljIGJvb2wgY21kcV90aHJlYWRf
aXNfaW5fd2ZlKHN0cnVjdCBjbWRxX3RocmVhZCAqdGhyZWFkKQo+ICAgICAgICAgcmV0dXJuIHJl
YWRsKHRocmVhZC0+YmFzZSArIENNRFFfVEhSX1dBSVRfVE9LRU4pICYgQ01EUV9USFJfSVNfV0FJ
VElORzsKPiAgfQo+Cj4gLXN0YXRpYyB2b2lkIGNtZHFfdGFza19leGVjX2RvbmUoc3RydWN0IGNt
ZHFfdGFzayAqdGFzaywgZW51bSBjbWRxX2NiX3N0YXR1cyBzdGEpCj4gK3N0YXRpYyB2b2lkIGNt
ZHFfdGFza19leGVjX2RvbmUoc3RydWN0IGNtZHFfdGFzayAqdGFzaywgaW50IHN0YSkKPiAgewo+
ICAgICAgICAgc3RydWN0IGNtZHFfdGFza19jYiAqY2IgPSAmdGFzay0+cGt0LT5hc3luY19jYjsK
PiAgICAgICAgIHN0cnVjdCBjbWRxX2NiX2RhdGEgZGF0YTsKPiBAQCAtMjQ0LDEwICsyNDQsMTAg
QEAgc3RhdGljIHZvaWQgY21kcV90aHJlYWRfaXJxX2hhbmRsZXIoc3RydWN0IGNtZHEgKmNtZHEs
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgY3Vycl90YXNrID0gdGFzazsKPgo+ICAgICAgICAg
ICAgICAgICBpZiAoIWN1cnJfdGFzayB8fCBjdXJyX3BhID09IHRhc2tfZW5kX3BhIC0gQ01EUV9J
TlNUX1NJWkUpIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBjbWRxX3Rhc2tfZXhlY19kb25l
KHRhc2ssIENNRFFfQ0JfTk9STUFMKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBjbWRxX3Rh
c2tfZXhlY19kb25lKHRhc2ssIDApOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGtmcmVlKHRh
c2spOwo+ICAgICAgICAgICAgICAgICB9IGVsc2UgaWYgKGVycikgewo+IC0gICAgICAgICAgICAg
ICAgICAgICAgIGNtZHFfdGFza19leGVjX2RvbmUodGFzaywgQ01EUV9DQl9FUlJPUik7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgY21kcV90YXNrX2V4ZWNfZG9uZSh0YXNrLCAtRU5PRVhFQyk7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgY21kcV90YXNrX2hhbmRsZV9lcnJvcihjdXJyX3Rh
c2spOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGtmcmVlKHRhc2spOwo+ICAgICAgICAgICAg
ICAgICB9Cj4gQEAgLTQxNSw3ICs0MTUsNyBAQCBzdGF0aWMgdm9pZCBjbWRxX21ib3hfc2h1dGRv
d24oc3RydWN0IG1ib3hfY2hhbiAqY2hhbikKPgo+ICAgICAgICAgbGlzdF9mb3JfZWFjaF9lbnRy
eV9zYWZlKHRhc2ssIHRtcCwgJnRocmVhZC0+dGFza19idXN5X2xpc3QsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbGlzdF9lbnRyeSkgewo+IC0gICAgICAgICAgICAgICBjbWRx
X3Rhc2tfZXhlY19kb25lKHRhc2ssIENNRFFfQ0JfRVJST1IpOwo+ICsgICAgICAgICAgICAgICBj
bWRxX3Rhc2tfZXhlY19kb25lKHRhc2ssIC1FQ09OTkFCT1JURUQpOwo+ICAgICAgICAgICAgICAg
ICBrZnJlZSh0YXNrKTsKPiAgICAgICAgIH0KPgo+IEBAIC00NTMsNyArNDUzLDcgQEAgc3RhdGlj
IGludCBjbWRxX21ib3hfZmx1c2goc3RydWN0IG1ib3hfY2hhbiAqY2hhbiwgdW5zaWduZWQgbG9u
ZyB0aW1lb3V0KQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpc3RfZW50cnkp
IHsKPiAgICAgICAgICAgICAgICAgY2IgPSAmdGFzay0+cGt0LT5hc3luY19jYjsKPiAgICAgICAg
ICAgICAgICAgaWYgKGNiLT5jYikgewo+IC0gICAgICAgICAgICAgICAgICAgICAgIGRhdGEuc3Rh
ID0gQ01EUV9DQl9FUlJPUjsKPiArICAgICAgICAgICAgICAgICAgICAgICBkYXRhLnN0YSA9IC1F
Q09OTkFCT1JURUQ7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgZGF0YS5kYXRhID0gY2ItPmRh
dGE7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgY2ItPmNiKGRhdGEpOwo+ICAgICAgICAgICAg
ICAgICB9Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWFpbGJveC9tdGstY21kcS1tYWls
Ym94LmggYi9pbmNsdWRlL2xpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5oCj4gaW5kZXgg
ZDVhOTgzZDY1ZjA1Li4yZjdkOWEzN2Q2MTEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9t
YWlsYm94L210ay1jbWRxLW1haWxib3guaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbWFpbGJveC9t
dGstY21kcS1tYWlsYm94LmgKPiBAQCAtNjUsMTMgKzY1LDggQEAgZW51bSBjbWRxX2NvZGUgewo+
ICAgICAgICAgQ01EUV9DT0RFX0xPR0lDID0gMHhhMCwKPiAgfTsKPgo+IC1lbnVtIGNtZHFfY2Jf
c3RhdHVzIHsKPiAtICAgICAgIENNRFFfQ0JfTk9STUFMID0gMCwKPiAtICAgICAgIENNRFFfQ0Jf
RVJST1IKPiAtfTsKPiAtCj4gIHN0cnVjdCBjbWRxX2NiX2RhdGEgewo+IC0gICAgICAgZW51bSBj
bWRxX2NiX3N0YXR1cyAgICAgc3RhOwo+ICsgICAgICAgaW50ICAgICAgICAgICAgICAgICAgICAg
c3RhOwo+ICAgICAgICAgdm9pZCAgICAgICAgICAgICAgICAgICAgKmRhdGE7Cj4gIH07Cj4KPiAt
LQo+IDIuMTcuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
