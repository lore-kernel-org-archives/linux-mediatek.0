Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F206C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 22:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TOzxf2bYl7YEiM0SvhlzubNL1nFLpGRsuCJEY9iKaCw=; b=sU3UsUwAULltgf
	M7La1kpO9WqWH2Iy4CfEzbQ3iAYT4Fv4XNBCjxwBeaRVJTnxSUJcZQNwS6qo3wYC1F3ESxL7m783F
	WHt3L+ku/Kxe8zbXEIfMaAV2fxb/C2hivaeIvLoEZUopj5FRfjCRBT74iXMZz6fUCOs7qpv72YW0W
	7Ex9Fbm6ANdFHwo6xI5ozUhEw0ExVFzKopVC0mRv0G0e0gKF5t6Stx8I121PWQVqxeCcc6grXD3Uu
	TRWGBOESTGcVMPpFTzkS0TGvu3c80hVuLOkd+OijgVqkmbOwVCB0wSKfzx9t3g7ziRPzrvrUmkKPg
	bqB+BeY7ZDFJpQ5OjjVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmNOY-00D4S9-81; Wed, 04 May 2022 22:22:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmNOU-00D4QI-SS
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 22:22:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 30DC2B82791;
 Wed,  4 May 2022 22:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B33A8C385A4;
 Wed,  4 May 2022 22:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651702961;
 bh=u0N155SWtOz1s9JJf+rKZJXEN795NA99QtHjC9yXwMg=;
 h=From:To:Cc:Subject:Date:From;
 b=VlSQexwAxmaPtAE+anI/70FQFfOaUAwKMwn8hFFGmKo72f/jkVGbne0pO1liJAxBW
 foy0y0TQnXwbwsQvlLFAjsK/D1ZikrGGqdoVwx1EVdoeeFX6Y7bXlMpXPL60t2Lvit
 KehQJm1MdQ47hmCdqe1SkKNh7hd3I6qrtwOqXxFyPdRvwHh/49Z5xzUtMaJCnnt0ZE
 drCQSqj8NJV3svCR5jWNeXE1b/p9lRXm8nGswiPWwl64OmPk8AlngYqCwNN6Ju/7B3
 1l2N2k/0vxk5BQTeLhhCQ3n/0mjRA0nJ0D2hbE5LgNGGNhRFAysTJWxGlFOzxy2Wuf
 RDvM9AGwfwhtw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Yang Li <yang.lee@linux.alibaba.com>
Subject: [GIT PULL] mediatek drm next for 5.19
Date: Thu,  5 May 2022 06:22:45 +0800
Message-Id: <1651702965-23630-1-git-send-email-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_152251_259747_6477F25B 
X-CRM114-Status: GOOD (  11.00  )
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

SGksIERhdmUgJiBEYW5pZWw6CgpUaGlzIGluY2x1ZGVzOgoKMS4gQWRkIGRpc3BsYXkgc3VwcG9y
dCBmb3IgTVQ4MTg2CjIuIE1pc2NlbGxhbmVvdXMgcmVmaW5lbWVudCBhbmQgZml4dXAuCgpSZWdh
cmRzLApDaHVuLUt1YW5nLgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAzMTIz
MTA5Mjg0MTc2YjE1MzI4NzQ1OTFmN2M4MWYzODM3YmJkYzE3OgoKICBMaW51eCA1LjE4LXJjMSAo
MjAyMi0wNC0wMyAxNDowODoyMSAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIGdpdCByZXBv
c2l0b3J5IGF0OgoKICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0IHRhZ3MvbWVkaWF0ZWstZHJtLW5leHQtNS4xOQoK
Zm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGI4YjhlZWRhNjNkNjBkNDM0ZmNiMDM1MWVk
NDVkYWY5ZjJkMTVhZmQ6CgogIGRybS9tZWRpYXRlazogbXRrX2RzaTogUmVtb3ZlIHVubmVjZXNz
YXJ5IHByaW50IGZ1bmN0aW9uIGRldl9lcnIoKSAoMjAyMi0wNS0wNSAwNTozNjo0OSArMDgwMCkK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KTWVkaWF0ZWsgRFJNIE5leHQgZm9yIExpbnV4IDUuMTkKCjEuIEFkZCBkaXNwbGF5
IHN1cHBvcnQgZm9yIE1UODE4NgoyLiBNaXNjZWxsYW5lb3VzIHJlZmluZW1lbnQgYW5kIGZpeHVw
LgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyAoMik6CiAgICAgIGRybS9tZWRp
YXRlazogbXRrX2RybV9wbGFuZTogVXNlIGttYWxsb2MgaW4gbXRrX3BsYW5lX2R1cGxpY2F0ZV9z
dGF0ZQogICAgICBkcm0vbWVkaWF0ZWs6IG10a19kcm1fY3J0YzogVXNlIGttYWxsb2MgaW4gbXRr
X2RybV9jcnRjX2R1cGxpY2F0ZV9zdGF0ZQoKQ2hlbi1ZdSBUc2FpICgxKToKICAgICAgZHJtL21l
ZGlhdGVrOiBGaXggRFBJIGNvbXBvbmVudCBkZXRlY3Rpb24gZm9yIE1UODE5MgoKTWlsZXMgQ2hl
biAoMSk6CiAgICAgIGRybS9tZWRpYXRlazogRml4IG10a19jZWNfbWFzaygpCgpOw61jb2xhcyBG
LiBSLiBBLiBQcmFkbyAoMSk6CiAgICAgIGRybS9tZWRpYXRlazogZHBpOiBVc2UgbXQ4MTgzIG91
dHB1dCBmb3JtYXRzIGZvciBtdDgxOTIKClJleC1CQyBDaGVuICg2KToKICAgICAgZHJtL21lZGlh
dGVrOiBBZGQgdmJsYW5rIHJlZ2lzdGVyL3VucmVnaXN0ZXIgY2FsbGJhY2sgZnVuY3Rpb25zCiAg
ICAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBtZWRpYXRlazogcmV2aXNlIGVudW0gdG8gY29uc3QK
ICAgICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1lZGlhdGVrOiBjaGFuZ2UgdG8gdXNlIGVudW0g
Zm9yIG11dGV4CiAgICAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBtZWRpYXRlazogYWRkIE1UODE4
NiBTb0MgYmluZGluZwogICAgICBkdC1iaW5kaW5nczogZGlzcGxheTogbWVkaWF0ZWs6IFVwZGF0
ZSBkaXNwX2FhbCBiaW5kaW5nIGZvciBNVDgxODMKICAgICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6
IG1lZGlhdGVrOiBVcGRhdGUgZGlzcF9hYWwgYmluZGluZyBmb3IgTVQ4MTkyIGFuZCBNVDgxOTUK
ClhpbmxlaSBMZWUgKDEpOgogICAgICBkdC1iaW5kaW5nczogZGlzcGxheTogbWVkaWF0ZWs6IGRw
aTogQWRkIGNvbXBhdGlibGUgZm9yIE1lZGlhVGVrIE1UODE4NgoKWWFuZyBMaSAoMSk6CiAgICAg
IGRybS9tZWRpYXRlazogbXRrX2RzaTogUmVtb3ZlIHVubmVjZXNzYXJ5IHByaW50IGZ1bmN0aW9u
IGRldl9lcnIoKQoKWW9uZ3FpYW5nIE5pdSAoMik6CiAgICAgIGRybS9tZWRpYXRlazogQWRkIGRp
c3BsYXkgc3VwcG9ydCBmb3IgTVQ4MTg2CiAgICAgIGRybS9tZWRpYXRlazogQWRkIGx1dCBkaWZm
IGZsYWcgZm9yIG5ldyBnYW1tYSBoYXJkd2FyZSBzdXBwb3J0CgogLi4uL2JpbmRpbmdzL2Rpc3Bs
YXkvbWVkaWF0ZWsvbWVkaWF0ZWssYWFsLnlhbWwgICAgfCAxMSArKysrLS0tCiAuLi4vYmluZGlu
Z3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxjY29yci55YW1sICB8ICA1ICsrKy0KIC4uLi9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGNvbG9yLnlhbWwgIHwgIDcgKystLS0K
IC4uLi9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpdGhlci55YW1sIHwgIDQg
Ky0tCiAuLi4vYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkcGkueWFtbCAgICB8
ICAxICsKIC4uLi9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGdhbW1hLnlhbWwg
IHwgIDQgKy0tCiAuLi4vYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtdXRleC55
YW1sICB8IDI1ICsrKysrKystLS0tLS0tLS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVr
L21lZGlhdGVrLG92bC0ybC55YW1sIHwgIDQgKysrCiAuLi4vYmluZGluZ3MvZGlzcGxheS9tZWRp
YXRlay9tZWRpYXRlayxvdmwueWFtbCAgICB8ICA4ICsrKy0tCiAuLi4vZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxwb3N0bWFzay55YW1sICAgICAgICB8ICA0ICsrKwogLi4uL2JpbmRpbmdzL2Rp
c3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWsscmRtYS55YW1sICAgfCAgNyArKy0tLQogZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19jZWMuYyAgICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2FhbC5jICAgICAgICAgICAgfCAgMiArLQogZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2Rydi5oICAgICAgICAgICAgfCAxOCArKysr
KysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9nYW1tYS5jICAgICAg
ICAgIHwgMzQgKysrKysrKysrKysrKysrKysrLS0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kaXNwX292bC5jICAgICAgICAgICAgfCAyMiArKysrKysrKysrLS0tLQogZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYyAgICAgICAgICAgfCAyMCArKysrKysrKyst
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jICAgICAgICAgICAgICAgICB8
ICA0ICstLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jICAgICAgICAg
ICAgfCAxNyArKysrKysrKystLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRw
X2NvbXAuYyAgICAgICAgfCAgNCArKysKIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2RkcF9jb21wLmggICAgICAgIHwgMjkgKysrKysrKysrKysrKy0tLS0tCiBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyAgICAgICAgICAgICB8IDMxICsrKysrKysrKysrKysr
KysrKysrCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jICAgICAgICAg
ICB8ICAyICstCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jICAgICAgICAgICAg
ICAgICB8ICAxIC0KIDI0IGZpbGVzIGNoYW5nZWQsIDE5MiBpbnNlcnRpb25zKCspLCA3NCBkZWxl
dGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
