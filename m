Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046B0EE57D1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Dec 2025 05:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sHKEzk3eiDkWr/mHmCD5Kjkc96F4fxGo9YLhfmfwt4I=; b=tKszll0OuxLiOYQ88wJswkYQwg
	MhxwIo8l+Wap21ncSFd5hz98kY9die6N6odJ7fJBWP9fID29eRn5IvxdDTvX7bRE9kh8wXXZWdfce
	64Dpx6emDy4fSlQTsE8g3lGZytCHz463YXflRXZBGFwH2owCCaZb01jC8Lbc6rf8xY22ghiQjfZcw
	LgcS5yyEYNy8I/6nm7NjZjSqlFx8qiFMeO11pmU/aGwlONDtjAyOcZsDJgA6yYl3jEVLMUjeUHHMy
	jXMnYrJiD0VAfgrNbWLRG94WlhXO5KX6gqH2jvyd2U6ScMX34M5gsQQsJ/2xrvh6j0j4D3sUWX9mx
	HCCdlDnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaomZ-00000005hjs-30rz;
	Wed, 31 Dec 2025 05:30:03 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaomW-00000005hjB-20Fo
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Dec 2025 05:30:01 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-37d13ddaa6aso71846821fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Dec 2025 21:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zacbowling-com.20230601.gappssmtp.com; s=20230601; t=1767158997; x=1767763797; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sHKEzk3eiDkWr/mHmCD5Kjkc96F4fxGo9YLhfmfwt4I=;
        b=UY5wGhWgFJJtoM6I3/Ug4mTG1R5vSzm6EEdKNBL4gqZefI5r2HMDgpBgAsMwMR8rxP
         mmHfR1tIH8o11OFqzfMSBmE1sP1oT9Ey74yc/YM6rSXI/UZIJ0m35wGjJTsmc7FOd1Kc
         oIwIMDJTTY1ocXIGyweSZ5waVld5DGEuK5ayqcpSY+2tjXp+ivOb2QDOyRajiMOAv4Sv
         tHK2Dm09m7Pjafs3z7BU+oaHJJidEcMkwi5HTpZvJudeaCLrrnDo8j5MNnSPCzD7ThbO
         /uhzvP1W2kyptVLNIkK2I8d1Peu6zVj+XVhVb5Cy7MnWnEkI4HmACxFtwUjxnImjdK+L
         REHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767158997; x=1767763797;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sHKEzk3eiDkWr/mHmCD5Kjkc96F4fxGo9YLhfmfwt4I=;
        b=A48aWx58e0KZ9ec8jV6T7Y0su0rZmy0gv5OHsciCkFPA6zIJDgNGOVEFMw7ZFgEhQa
         wTrCTFRc1iip6s785TdoqSWI/dnj8peaKjinuNxZ5PiiENePdYKqPpZAscy29y2xELlC
         G85F13cA++JxvDhb2t902JA5mZ97nLNtRUEA7LaeqsesN0N/CAMCbLKTkETBMvPqlC4g
         nQmqNPm8YR6CR1ahqy+WiXXDK2NTe1jPoithd7rB+U+TmP71u2cHczoDYRz/3jbX0p3t
         gdFJOdUlyTLjSOumuPUtF2JZwZYuXyL0bFRH9MtYT/Kf7YbpTtLdxdTjpcfgtNJcXwsQ
         rb5g==
X-Forwarded-Encrypted: i=1; AJvYcCVmDlNrwAJic1ixXiYbnFdis14IT4ZfLpxF2NWPiN5tVyREhYIbQlMgc+KZy6HRUv2Pbo9k7uzSq1ZEXhRS8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKmO0PkouebVqc5TDVV1rFVjswoldXrgJVE4VIBr0aGfjwimLA
	3sfnadB2kHlHw2uBU81PS5V3lOCKjIOr++hdBLbJbOEDAAki5Cyorex1Ym5EYokQP1bp3Mdzco1
	soh1iSkbk3KqJdA8Hx2cbtLLBlGDIbDaLteCGXHG4pw==
X-Gm-Gg: AY/fxX71i6gMygImmDNw/XIbyTHEQjWgxsL70TUGmxDGLIa3Xpw857691dOs7aNnvNc
	cesls2Znq6YKStZ2JcV/rDr/ceuCV2EReiJRBRiy/3eSSDSPvF24XqEZwgW244nqdxUAOlWUpQa
	N5O1rkwR3yzZAFbpv+japK9Pc3qrULWwXIHaj7jS4gmv9lPkzjzgtHQSdk2k31YrIGR2tT330Mw
	zt1j+Ldqyh0Yxl6Ib7V9/fvRPxoyZK3+EKn5vUgeoH2wlnAYGrMucbXS6URGW8bz8MRf/TXVU1o
	9Bd3a0TT2paa1VSeFpLrdnOD+IlLZOO7C4ek
X-Google-Smtp-Source: AGHT+IGDUCXI56/dlMWNu29haOFoqFvTITaetCiiOEFP86knLXB3YNbN2QcQpknZHxUdToz96MXCmldzsEzuMZlPLJQ=
X-Received: by 2002:a05:651c:550:b0:37b:9977:7e62 with SMTP id
 38308e7fff4ca-3812164303bmr101593511fa.31.1767158996737; Tue, 30 Dec 2025
 21:29:56 -0800 (PST)
MIME-Version: 1.0
From: Zac Bowling <zac@zacbowling.com>
Date: Tue, 30 Dec 2025 21:29:44 -0800
X-Gm-Features: AQt7F2rCJdqAr_4RJVPogHhFbL_7i8uMhusDazpEeOOcQ4vLEEocid67AfQWDFk
Message-ID: <CAA5_Hq7vNOy9oCGkkgyukq2OP=a5yL_3ZKBdmNtBXS+zp6byiQ@mail.gmail.com>
Subject: [PATCH] wifi: mt76: mt7925: fix NULL pointer dereference in vif
 iteration loops
To: linux-wireless@vger.kernel.org
Cc: lorenzo@kernel.org, nbd@nbd.name, ryder.lee@mediatek.com, kvalo@kernel.org, 
	sean.wang@mediatek.com, deren.wu@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000004347a5064738c41f"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_213000_810898_B9F4D917 
X-CRM114-Status: GOOD (  13.31  )
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

--0000000000004347a5064738c41f
Content-Type: text/plain; charset="UTF-8"

I was getting a kernel panic on my new Framework Desktop running
Ubuntu 25.10 with this specific WIFI chipset.

mt792x_vif_to_bss_conf() can return NULL when iterating over valid_links
during HW reset or other state transitions, because the link configuration
in mac80211 may not be set up yet even though the driver's valid_links
bitmap has the link marked as valid.

This causes a NULL pointer dereference in mt76_connac_mcu_uni_add_dev()
when it tries to access bss_conf->vif->type, and similar crashes in other
functions that use bss_conf without checking.

The crash manifests as:
  BUG: kernel NULL pointer dereference, address: 0000000000000000
  RIP: 0010:mt76_connac_mcu_uni_add_dev+0xba/0x1f0 [mt76_connac_lib]
  Call Trace:
   mt7925_vif_connect_iter+0xcb/0x240 [mt7925_common]
   __iterate_interfaces+0x92/0x130 [mac80211]
   ieee80211_iterate_interfaces+0x3d/0x60 [mac80211]
   mt7925_mac_reset_work+0x105/0x190 [mt7925_common]

Add NULL checks for bss_conf in all loops that iterate over valid_links
and call mt792x_vif_to_bss_conf(), skipping links where the mac80211
link configuration is not yet available.

Reported-by: Zac Bowling <zac@zacbowling.com>
Signed-off-by: Zac Bowling <zac@zacbowling.com>

--0000000000004347a5064738c41f
Content-Type: application/octet-stream; 
	name="0001-wifi-mt76-mt7925-fix-NULL-pointer-dereference-in-vif.patch"
Content-Disposition: attachment; 
	filename="0001-wifi-mt76-mt7925-fix-NULL-pointer-dereference-in-vif.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mjtkmyu90>
X-Attachment-Id: f_mjtkmyu90

RnJvbSA2NzkwZTY1NjAzMGZiMjM1MjdhYTVjMGQ2ZWFhMjhjZTAyOTMzNWIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBaYWMgQm93bGluZyA8emFjQHphY2Jvd2xpbmcuY29tPgpEYXRl
OiBUdWUsIDMwIERlYyAyMDI1IDIwOjMyOjU2IC0wODAwClN1YmplY3Q6IFtQQVRDSF0gd2lmaTog
bXQ3NjogbXQ3OTI1OiBmaXggTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGluIHZpZgogaXRlcmF0
aW9uIGxvb3BzCgptdDc5MnhfdmlmX3RvX2Jzc19jb25mKCkgY2FuIHJldHVybiBOVUxMIHdoZW4g
aXRlcmF0aW5nIG92ZXIgdmFsaWRfbGlua3MKZHVyaW5nIEhXIHJlc2V0IG9yIG90aGVyIHN0YXRl
IHRyYW5zaXRpb25zLCBiZWNhdXNlIHRoZSBsaW5rIGNvbmZpZ3VyYXRpb24KaW4gbWFjODAyMTEg
bWF5IG5vdCBiZSBzZXQgdXAgeWV0IGV2ZW4gdGhvdWdoIHRoZSBkcml2ZXIncyB2YWxpZF9saW5r
cwpiaXRtYXAgaGFzIHRoZSBsaW5rIG1hcmtlZCBhcyB2YWxpZC4KClRoaXMgY2F1c2VzIGEgTlVM
TCBwb2ludGVyIGRlcmVmZXJlbmNlIGluIG10NzZfY29ubmFjX21jdV91bmlfYWRkX2RldigpCndo
ZW4gaXQgdHJpZXMgdG8gYWNjZXNzIGJzc19jb25mLT52aWYtPnR5cGUsIGFuZCBzaW1pbGFyIGNy
YXNoZXMgaW4gb3RoZXIKZnVuY3Rpb25zIHRoYXQgdXNlIGJzc19jb25mIHdpdGhvdXQgY2hlY2tp
bmcuCgpUaGUgY3Jhc2ggbWFuaWZlc3RzIGFzOgogIEJVRzoga2VybmVsIE5VTEwgcG9pbnRlciBk
ZXJlZmVyZW5jZSwgYWRkcmVzczogMDAwMDAwMDAwMDAwMDAwMAogIFJJUDogMDAxMDptdDc2X2Nv
bm5hY19tY3VfdW5pX2FkZF9kZXYrMHhiYS8weDFmMCBbbXQ3Nl9jb25uYWNfbGliXQogIENhbGwg
VHJhY2U6CiAgIG10NzkyNV92aWZfY29ubmVjdF9pdGVyKzB4Y2IvMHgyNDAgW210NzkyNV9jb21t
b25dCiAgIF9faXRlcmF0ZV9pbnRlcmZhY2VzKzB4OTIvMHgxMzAgW21hYzgwMjExXQogICBpZWVl
ODAyMTFfaXRlcmF0ZV9pbnRlcmZhY2VzKzB4M2QvMHg2MCBbbWFjODAyMTFdCiAgIG10NzkyNV9t
YWNfcmVzZXRfd29yaysweDEwNS8weDE5MCBbbXQ3OTI1X2NvbW1vbl0KCkFkZCBOVUxMIGNoZWNr
cyBmb3IgYnNzX2NvbmYgaW4gYWxsIGxvb3BzIHRoYXQgaXRlcmF0ZSBvdmVyIHZhbGlkX2xpbmtz
CmFuZCBjYWxsIG10NzkyeF92aWZfdG9fYnNzX2NvbmYoKSwgc2tpcHBpbmcgbGlua3Mgd2hlcmUg
dGhlIG1hYzgwMjExCmxpbmsgY29uZmlndXJhdGlvbiBpcyBub3QgeWV0IGF2YWlsYWJsZS4KClJl
cG9ydGVkLWJ5OiBaYWMgQm93bGluZyA8emFjQHphY2Jvd2xpbmcuY29tPgpTaWduZWQtb2ZmLWJ5
OiBaYWMgQm93bGluZyA8emFjQHphY2Jvd2xpbmcuY29tPgotLS0KIGRyaXZlcnMvbmV0L3dpcmVs
ZXNzL21lZGlhdGVrL210NzYvbXQ3OTI1L21hYy5jICB8IDYgKysrKysrCiBkcml2ZXJzL25ldC93
aXJlbGVzcy9tZWRpYXRlay9tdDc2L210NzkyNS9tYWluLmMgfCA4ICsrKysrKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJl
bGVzcy9tZWRpYXRlay9tdDc2L210NzkyNS9tYWMuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL21l
ZGlhdGVrL210NzYvbXQ3OTI1L21hYy5jCmluZGV4IDg3MWI2NzEwMS4uMTg0ZWZlOGFmIDEwMDY0
NAotLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210NzkyNS9tYWMuYwor
KysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210NzkyNS9tYWMuYwpAQCAt
MTI3MSw2ICsxMjcxLDEyIEBAIG10NzkyNV92aWZfY29ubmVjdF9pdGVyKHZvaWQgKnByaXYsIHU4
ICptYWMsCiAJCWJzc19jb25mID0gbXQ3OTJ4X3ZpZl90b19ic3NfY29uZih2aWYsIGkpOwogCQlt
Y29uZiA9IG10NzkyeF92aWZfdG9fbGluayhtdmlmLCBpKTsKIAorCQkvKiBTa2lwIGxpbmtzIHRo
YXQgZG9uJ3QgaGF2ZSBic3NfY29uZiBzZXQgdXAgeWV0IGluIG1hYzgwMjExLgorCQkgKiBUaGlz
IGNhbiBoYXBwZW4gZHVyaW5nIEhXIHJlc2V0IHdoZW4gbGluayBzdGF0ZSBpcyBpbmNvbnNpc3Rl
bnQuCisJCSAqLworCQlpZiAoIWJzc19jb25mKQorCQkJY29udGludWU7CisKIAkJbXQ3Nl9jb25u
YWNfbWN1X3VuaV9hZGRfZGV2KCZkZXYtPm1waHksIGJzc19jb25mLCAmbWNvbmYtPm10NzYsCiAJ
CQkJCSAgICAmbXZpZi0+c3RhLmRlZmxpbmsud2NpZCwgdHJ1ZSk7CiAJCW10NzkyNV9tY3Vfc2V0
X3R4KGRldiwgYnNzX2NvbmYpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVk
aWF0ZWsvbXQ3Ni9tdDc5MjUvbWFpbi5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsv
bXQ3Ni9tdDc5MjUvbWFpbi5jCmluZGV4IDJkMzU4YTk2Ni4uMzAwMWE2MmE4IDEwMDY0NAotLS0g
YS9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210NzkyNS9tYWluLmMKKysrIGIv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc5MjUvbWFpbi5jCkBAIC0xMzA0
LDYgKzEzMDQsOCBAQCBtdDc5MjVfbWxvX3BtX2l0ZXIodm9pZCAqcHJpdiwgdTggKm1hYywgc3Ry
dWN0IGllZWU4MDIxMV92aWYgKnZpZikKIAltdDc5MnhfbXV0ZXhfYWNxdWlyZShkZXYpOwogCWZv
cl9lYWNoX3NldF9iaXQoaSwgJnZhbGlkLCBJRUVFODAyMTFfTUxEX01BWF9OVU1fTElOS1MpIHsK
IAkJYnNzX2NvbmYgPSBtdDc5MnhfdmlmX3RvX2Jzc19jb25mKHZpZiwgaSk7CisJCWlmICghYnNz
X2NvbmYpCisJCQljb250aW51ZTsKIAkJbXQ3OTI1X21jdV91bmlfYnNzX3BzKGRldiwgYnNzX2Nv
bmYpOwogCX0KIAltdDc5MnhfbXV0ZXhfcmVsZWFzZShkZXYpOwpAQCAtMTYzMCw2ICsxNjMyLDgg
QEAgc3RhdGljIHZvaWQgbXQ3OTI1X2lwdjZfYWRkcl9jaGFuZ2Uoc3RydWN0IGllZWU4MDIxMV9o
dyAqaHcsCiAKIAlmb3JfZWFjaF9zZXRfYml0KGksICZ2YWxpZCwgSUVFRTgwMjExX01MRF9NQVhf
TlVNX0xJTktTKSB7CiAJCWJzc19jb25mID0gbXQ3OTJ4X3ZpZl90b19ic3NfY29uZih2aWYsIGkp
OworCQlpZiAoIWJzc19jb25mKQorCQkJY29udGludWU7CiAJCV9fbXQ3OTI1X2lwdjZfYWRkcl9j
aGFuZ2UoaHcsIGJzc19jb25mLCBpZGV2KTsKIAl9CiB9CkBAIC0xODYxLDYgKzE4NjUsOCBAQCBz
dGF0aWMgdm9pZCBtdDc5MjVfdmlmX2NmZ19jaGFuZ2VkKHN0cnVjdCBpZWVlODAyMTFfaHcgKmh3
LAogCWlmIChjaGFuZ2VkICYgQlNTX0NIQU5HRURfQVJQX0ZJTFRFUikgewogCQlmb3JfZWFjaF9z
ZXRfYml0KGksICZ2YWxpZCwgSUVFRTgwMjExX01MRF9NQVhfTlVNX0xJTktTKSB7CiAJCQlic3Nf
Y29uZiA9IG10NzkyeF92aWZfdG9fYnNzX2NvbmYodmlmLCBpKTsKKwkJCWlmICghYnNzX2NvbmYp
CisJCQkJY29udGludWU7CiAJCQltdDc5MjVfbWN1X3VwZGF0ZV9hcnBfZmlsdGVyKCZkZXYtPm10
NzYsIGJzc19jb25mKTsKIAkJfQogCX0KQEAgLTE4NzYsNiArMTg4Miw4IEBAIHN0YXRpYyB2b2lk
IG10NzkyNV92aWZfY2ZnX2NoYW5nZWQoc3RydWN0IGllZWU4MDIxMV9odyAqaHcsCiAJCQl9IGVs
c2UgaWYgKG12aWYtPm1sb19wbV9zdGF0ZSA9PSBNVDc5MnhfTUxPX0NIQU5HRURfUFMpIHsKIAkJ
CQlmb3JfZWFjaF9zZXRfYml0KGksICZ2YWxpZCwgSUVFRTgwMjExX01MRF9NQVhfTlVNX0xJTktT
KSB7CiAJCQkJCWJzc19jb25mID0gbXQ3OTJ4X3ZpZl90b19ic3NfY29uZih2aWYsIGkpOworCQkJ
CQlpZiAoIWJzc19jb25mKQorCQkJCQkJY29udGludWU7CiAJCQkJCW10NzkyNV9tY3VfdW5pX2Jz
c19wcyhkZXYsIGJzc19jb25mKTsKIAkJCQl9CiAJCQl9Ci0tIAoyLjUxLjAKCg==
--0000000000004347a5064738c41f--

