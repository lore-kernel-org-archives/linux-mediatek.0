Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652A4C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Nov 2021 10:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y35tFCpVM6Yim94X8N+nf4pJlGrHqjU/Ciup25eC7ow=; b=qKx1/zAQGFpZxX
	9B75Ws+28HqJ+NZ2dqU/BnSqCC1x2zliz89zEzbUEojnptadK5Zcfj+e4blou12aO5jjxysK6Zpg4
	mtNMSrGHf6CSzOxyq2783WjMVaXRUK/xhUOhyrPIZfhuahxK0I9kPLFOr53GXTAz7OylLAyNnhGiN
	kY8nsSCsyeGL+uzYnWgbaf0id1gFSn+niHwa6N3ZCwb/HOye679k0h84ZrOkXTuRYnXXwpHO+Bxep
	A/wpJd10R5kf9nDIpEfSqTPcOxAT+u04j1q+I6G3H+4kPhs5HdZUt3GxosIe1EmWPf/ySAifsEYz5
	E0k00s6YcEWp5I/h0BtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpT4F-001hw9-48; Tue, 23 Nov 2021 10:30:27 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpT4C-001hv2-MB
 for linux-mediatek@lists.infradead.org; Tue, 23 Nov 2021 10:30:26 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:e4da:38c:79e9:48bf])
 by albert.telenet-ops.be with bizsmtp
 id MmWE260014yPVd606mWEn0; Tue, 23 Nov 2021 11:30:21 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mpT41-00EUu8-OA; Tue, 23 Nov 2021 11:30:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mpT41-000JAa-B5; Tue, 23 Nov 2021 11:30:13 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: YC Hung <yc.hung@mediatek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] ASoC: SOF: mediatek: Use %pR/%pa to print resources/physical
 addresses
Date: Tue, 23 Nov 2021 11:30:13 +0100
Message-Id: <20211123103013.73645-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_023024_895717_C083057E 
X-CRM114-Status: GOOD (  11.93  )
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

T24gMzItYml0IHdpdGggQ09ORklHX0FSQ0hfRE1BX0FERFJfVF82NEJJVD1uOgoKICAgIHNvdW5k
L3NvYy9zb2YvbWVkaWF0ZWsvbXQ4MTk1L210ODE5NS5jOiBJbiBmdW5jdGlvbiDigJhwbGF0Zm9y
bV9wYXJzZV9yZXNvdXJjZeKAmToKICAgIHNvdW5kL3NvYy9zb2YvbWVkaWF0ZWsvbXQ4MTk1L210
ODE5NS5jOjUxOjE1OiBlcnJvcjogZm9ybWF0IOKAmCVsbHjigJkgZXhwZWN0cyBhcmd1bWVudCBv
ZiB0eXBlIOKAmGxvbmcgbG9uZyB1bnNpZ25lZCBpbnTigJksIGJ1dCBhcmd1bWVudCA0IGhhcyB0
eXBlIOKAmHVuc2lnbmVkIGludOKAmSBbLVdlcnJvcj1mb3JtYXQ9XQogICAgICAgNTEgfCAgZGV2
X2RiZyhkZXYsICJETUEgcGJhc2U9MHglbGx4LCBzaXplPTB4JWxseFxuIiwKCSAgfCAgICAgICAg
ICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKICAgIHNvdW5kL3NvYy9z
b2YvbWVkaWF0ZWsvbXQ4MTk1L210ODE5NS5jOiBJbiBmdW5jdGlvbiDigJhhZHNwX21lbW9yeV9y
ZW1hcF9pbml04oCZOgogICAgc291bmQvc29jL3NvZi9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LmM6
MTY3OjE1OiBlcnJvcjogZm9ybWF0IOKAmCVsbHjigJkgZXhwZWN0cyBhcmd1bWVudCBvZiB0eXBl
IOKAmGxvbmcgbG9uZyB1bnNpZ25lZCBpbnTigJksIGJ1dCBhcmd1bWVudCA0IGhhcyB0eXBlIOKA
mHBoeXNfYWRkcl904oCZIHtha2Eg4oCYdW5zaWduZWQgaW504oCZfSBbLVdlcnJvcj1mb3JtYXQ9
XQogICAgICAxNjcgfCAgZGV2X2RiZyhkZXYsICJhZHNwLT5wYV9kcmFtICVsbHgsIG9mZnNldCAl
I3hcbiIsIGFkc3AtPnBhX2RyYW0sIG9mZnNldCk7CgkgIHwgICAgICAgICAgICAgICBefn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CgogICAgc291bmQvc29jL3NvZi9tZWRpYXRlay9t
dDgxOTUvbXQ4MTk1LmM6IEluIGZ1bmN0aW9uIOKAmGFkc3Bfc2hhcmVkX2Jhc2VfaW9yZW1hcOKA
mToKICAgIHNvdW5kL3NvYy9zb2YvbWVkaWF0ZWsvbXQ4MTk1L210ODE5NS5jOjE5NjoxNTogZXJy
b3I6IGZvcm1hdCDigJglbGx44oCZIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhsb25nIGxv
bmcgdW5zaWduZWQgaW504oCZLCBidXQgYXJndW1lbnQgNSBoYXMgdHlwZSDigJhwaHlzX2FkZHJf
dOKAmSB7YWthIOKAmHVuc2lnbmVkIGludOKAmX0gWy1XZXJyb3I9Zm9ybWF0PV0KICAgICAgMTk2
IHwgIGRldl9kYmcoZGV2LCAic2hhcmVkLWRyYW0gdmJhc2U9JXAsIHBoeSBhZGRyIDolbGx4LCAg
c2l6ZT0lI3hcbiIsCgkgIHwgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KCkZpeCB0aGUgZmlyc3QgY2FzZXMgYnkgcHJpbnRp
bmcgdGhlIGZ1bGwgcmVzb3VyY2UgdXNpbmcgJXBSLgpGaXggdGhlIG90aGVyIGNhc2VzIGJ5IHBy
aW50aW5nIHRoZSBwaHlzaWNhbCBhZGRyZXNzZXMgdXNpbmcgJXBhLgoKUmVwb3J0ZWQtYnk6IG5v
cmVwbHlAZWxsZXJtYW4uaWQuYXUKRml4ZXM6IDMyZDdlMDNkMjZmZDkzMTggKCJBU29DOiBTT0Y6
IG1lZGlhdGVrOiBBZGQgbXQ4MTk1IGhhcmR3YXJlIHN1cHBvcnQiKQpTaWduZWQtb2ZmLWJ5OiBH
ZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgotLS0KIHNvdW5kL3NvYy9z
b2YvbWVkaWF0ZWsvbXQ4MTk1L210ODE5NS5jIHwgOSArKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc291bmQvc29j
L3NvZi9tZWRpYXRlay9tdDgxOTUvbXQ4MTk1LmMgYi9zb3VuZC9zb2Mvc29mL21lZGlhdGVrL210
ODE5NS9tdDgxOTUuYwppbmRleCA0MGU1YTI1ODc1YTZhOTNjLi5iMTU4MGI2YWM4ZTE5ZTYxIDEw
MDY0NAotLS0gYS9zb3VuZC9zb2Mvc29mL21lZGlhdGVrL210ODE5NS9tdDgxOTUuYworKysgYi9z
b3VuZC9zb2Mvc29mL21lZGlhdGVrL210ODE5NS9tdDgxOTUuYwpAQCAtNDgsOCArNDgsNyBAQCBz
dGF0aWMgaW50IHBsYXRmb3JtX3BhcnNlX3Jlc291cmNlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYsIHZvaWQgKmRhdGEpCiAJCXJldHVybiByZXQ7CiAJfQogCi0JZGV2X2RiZyhkZXYsICJE
TUEgcGJhc2U9MHglbGx4LCBzaXplPTB4JWxseFxuIiwKLQkJKHBoeXNfYWRkcl90KXJlcy5zdGFy
dCwgcmVzb3VyY2Vfc2l6ZSgmcmVzKSk7CisJZGV2X2RiZyhkZXYsICJETUEgJXBSXG4iLCAmcmVz
KTsKIAogCXJldCA9IG9mX3Jlc2VydmVkX21lbV9kZXZpY2VfaW5pdChkZXYpOwogCWlmIChyZXQp
IHsKQEAgLTE2NCw3ICsxNjMsNyBAQCBzdGF0aWMgaW50IGFkc3BfbWVtb3J5X3JlbWFwX2luaXQo
c3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgbXRrX2Fkc3BfY2hpcF9pbmZvCiAJb2Zmc2V0ID0g
YWRzcC0+cGFfZHJhbSAtIERSQU1fUEhZU19CQVNFX0ZST01fRFNQX1ZJRVc7CiAJYWRzcC0+ZHJh
bV9vZmZzZXQgPSBvZmZzZXQ7CiAJb2Zmc2V0ID4+PSBEUkFNX1JFTUFQX1NISUZUOwotCWRldl9k
YmcoZGV2LCAiYWRzcC0+cGFfZHJhbSAlbGx4LCBvZmZzZXQgJSN4XG4iLCBhZHNwLT5wYV9kcmFt
LCBvZmZzZXQpOworCWRldl9kYmcoZGV2LCAiYWRzcC0+cGFfZHJhbSAlcGEsIG9mZnNldCAlI3hc
biIsICZhZHNwLT5wYV9kcmFtLCBvZmZzZXQpOwogCXdyaXRlbChvZmZzZXQsIHZhZGRyX2VtaV9t
YXApOwogCWlmIChvZmZzZXQgIT0gcmVhZGwodmFkZHJfZW1pX21hcCkpIHsKIAkJZGV2X2Vycihk
ZXYsICJ3cml0ZSBlbWkgbWFwIGZhaWwgOiAlI3hcbiIsIHJlYWRsKHZhZGRyX2VtaV9tYXApKTsK
QEAgLTE5Myw4ICsxOTIsOCBAQCBzdGF0aWMgaW50IGFkc3Bfc2hhcmVkX2Jhc2VfaW9yZW1hcChz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LCB2b2lkICpkYXRhKQogCQkJcmV0dXJuIC1FTk9N
RU07CiAJCX0KIAl9Ci0JZGV2X2RiZyhkZXYsICJzaGFyZWQtZHJhbSB2YmFzZT0lcCwgcGh5IGFk
ZHIgOiVsbHgsICBzaXplPSUjeFxuIiwKLQkJYWRzcC0+c2hhcmVkX2RyYW0sIGFkc3AtPnBhX3No
YXJlZF9kcmFtLCBzaGFyZWRfc2l6ZSk7CisJZGV2X2RiZyhkZXYsICJzaGFyZWQtZHJhbSB2YmFz
ZT0lcCwgcGh5IGFkZHIgOiVwYSwgIHNpemU9JSN4XG4iLAorCQlhZHNwLT5zaGFyZWRfZHJhbSwg
JmFkc3AtPnBhX3NoYXJlZF9kcmFtLCBzaGFyZWRfc2l6ZSk7CiAKIAlyZXR1cm4gMDsKIH0KLS0g
CjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
