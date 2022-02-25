Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C3CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 13:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZVwmzGv00Ql2i4NTx24BPFA9xGgXxE4L/ifqDol9k3Y=; b=SuY5jQR5d17tPV
	bkQ8iAzeF4keoyvwDmSno1d/pDZhZ+XMXcq++nPFcHYfTgaQpWtvl1kT80tKnzSV2QVZ9etqFpiYk
	7qKo8kmzRaHkRPijq7NQew2ESNLZv/sx2sbuFYS7nJHe6YmNenwKN6QWGjsyBwkVl74iD/mlHcgVR
	YG7nblAiN3Q83PyjxkjOn1n1vXNF80E07cLRms/iteEhlpaXlSfDi5w9FtmOmd/O6MTcR7MKPA/Di
	5UJC5feCnOsWWJL/8UKHmGh/Vna/hjG2loP+BVxp9iQ77DujkSAZh2bkZBcVrEqBQUeE6rrIXDRkR
	3yBGhLuoUWSAOLQ5KOfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNb3h-005GKZ-0a; Fri, 25 Feb 2022 13:54:57 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNaul-005DDu-Op
 for linux-mediatek@lists.infradead.org; Fri, 25 Feb 2022 13:45:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id 83DA71F4107C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645796740;
 bh=Jse5jslyQwK8jYrGmsf8TVyXCyfWaI4dN1Xg9g/UKcA=;
 h=From:To:Cc:Subject:Date:From;
 b=gc1+GTNX4IdQTjOQM2VQD5ijDrvyUPUpqyrQFN0haUjKHtHW0sNDisvEDtU17qO46
 bigv6hv4lf6EzHG5cLoEnnD//MUgMcFWQJQNA6pJB7qyus7PPI3jYDFa6XZUchQOsF
 BoUAJqJxSzl2U50ux1ZNInoIRGQ7sN8xEw9JuG3JQdokodMBPz4PK26qenZpfwRyiS
 BdPmG6p0EvgIyZ0iaU3W1pdk4lCqFjUd6RpScWwzbgXHbgaZgq4zFRECK+3yNvp6jI
 pK9lmNlAohPakmyxW8VT2umSKzX/PvIHVAom67c/lItl2j6WJXzcddmsYjtJoCaaIw
 nZayvxyFFqCwQ==
From: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, andrzej.hajda@intel.com, narmstrong@baylibre.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH 0/2] Mitigate race condition problems when unbinding DRM driver
Date: Fri, 25 Feb 2022 14:45:02 +0100
Message-Id: <20220225134504.457245-1-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_054543_984393_E377ACA2 
X-CRM114-Status: GOOD (  14.19  )
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

SGkgYWxsLAoKSSdtIHNlbmRpbmcgdGhlc2UgcGF0Y2hlcyB0byB0cnkgdG8gaW1wcm92ZSB0aGUg
Y3VycmVudCBzaXR1YXRpb24gZm9yIGEKcGFydGljdWxhciBjb3JuZXIgY2FzZSAoRFJNIGRyaXZl
ciB1bmJpbmRpbmcpLgoKSSBjb3VsZCByZXByb2R1Y2UgYSBzcGVjaWZpYyByYWNlIGNvbmRpdGlv
biBkdXJpbmcgdGhlIHVuYmluZGluZyBvZiB0aGUKbWVkaWF0ZWstZHJtIGRyaXZlciB0aGF0IGNh
dXNlZCBhbiBpbnZhbGlkIG1lbW9yeSBhZGRyZXNzLiBUaGUgcmFjZQpjb25kaXRpb24gaXMgdHJp
Z2dlcmVkIGJ5IGEgdXNlcnNwYWNlIGV2ZW50IChnbm9tZS1zaGVsbCByZXF1ZXN0aW5nIGEKRFJN
IEdFVF9DT05ORUNUT1IgaW9jdGwpIHdoaWxlIHRoZSBlbmNvZGVycyBhbmQgZHJpdmVycyBhcmUg
aW4gdGhlCnByb2Nlc3Mgb2YgYmVpbmcgZGlzYWJsZWQuCgpXaGlsZSBJIHRyaWVkIHRvIG1pdGln
YXRlIHRoaXMgYnkgbWFraW5nIGEgc21hbGwgY2hhbmdlIGluIHRoZQpwYXJhZGUtcHM4NjQwIGRy
aXZlciAoZm9yIHRoZSBicmlkZ2UgSSdtIHRlc3Rpbmcgb24pIGFuZCBieSBtYWtpbmcgYQpjb3Vw
bGUgb2YgZnVuY3Rpb25zIGluIGRybV9icmlkZ2UuYyBtb3JlIHJvYnVzdCwgdGhpcyBpcyBvbmx5
IGEgc3ltcHRvbQpvZiBhIGxhcmdlciBwcm9ibGVtIHRoYXQgbWlnaHQgbm90IGJlIGdldHRpbmcg
ZW5vdWdoIGF0dGVudGlvbiwKdW5kZXJzdGFuZGFibHksIGJlY2F1c2UgdGhpcyBpcyBhbiB1bnVz
dWFsIGNvcm5lciBjYXNlLgoKVGhlIHNjZW5hcmlvIGxvb2tzIGxpa2UgdGhpczoKCjx1c2Vyc3Bh
Y2U+OiB1bmJpbmQgbWVkaWF0ZWstZHJtICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0rCiAgICAgICAg
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8CiAgICAgICAg
ICAgPGtlcm5lbD4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8CiAgICAgICAg
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8CiAgICAgICAg
ICAgICAuLi4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8CiAgICAgICAg
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC4uLgogICAgICAg
IG10a19kc2lfdW5iaW5kICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfAogICAgICAg
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfAogICAgICAg
ICAgICAgIGAtIGRybV9lbmNvZGVyX2NsZWFudXAgICAgICAgICAgICAgICAgICAgdgogICAgICAg
ICAgICAgIHwgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ25vbWUtc2hlbGwK
ICAgICAgICAgICAgIC4uLiAgYC0gZHJtX2JyaWRnZV9kZXRhY2ggKjwtLS0tLS0gaW9jdGwgKEdF
VF9DT05ORUNUT1IpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
PGtlcm5lbD4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC4u
LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8CiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwczg2NDBfYnJpZGdlX2dldF9lZGlkCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBgZHJtX2JyaWRnZV9jaGFpbl9wb3N0X2Rpc2FibGUK
CndoaWNoIGNhdXNlcyBkcm1fYnJpZGdlX2NoYWluX3Bvc3RfZGlzYWJsZSgpIHRvIHdhbGsgdGhl
IGJyaWRnZSBjaGFpbgphZnRlciB0aGUgYnJpZGdlIGhhcyBhbHJlYWR5IGJlZW4gZGV0YWNoZWQg
YW5kIHJlbW92ZWQgZnJvbSB0aGUgbGlzdC4gSQpndWVzcyBhIG1vcmUgcmFkaWNhbCBhbmQgc3Vi
c3lzdGVtLXdpZGUgc29sdXRpb24gd291bGQgYmUgdG8gbm90IGFsbG93Cm9yIHRvIGJsb2NrIGNl
cnRhaW4gaW9jdGwgY2FsbHMgb25jZSB0aGUgZHJpdmVyIGhhcyBzdGFydGVkIHRvIHVuYmluZCwK
YnV0IEknZCBsaWtlIHRvIGhlYXIgeW91ciBvcGluaW9uIG9uIHRoaXMuCgpUaGlzIHdhcyB0ZXN0
ZWQgb24gYW4gQWNlciBDaHJvbWVib29rIFIxMyAoRWxtLCBNVDgxNzMpIHJ1bm5pbmcgRGViaWFu
ClNpZCwgdGhlIGNvbW1hbmQgdGhhdCB0cmlnZ2VycyB0aGUgcmFjZSBjb25kaXRpb24gaXMKCmVj
aG8gbWVkaWF0ZWstZHJtLjEyLmF1dG8gPiAvc3lzL2J1cy9wbGF0Zm9ybS9kcml2ZXJzL21lZGlh
dGVrLWRybS91bmJpbmQKCkNoZWVycywKUmljYXJkbwoKUmljYXJkbyBDYcOxdWVsbyAoMik6CiAg
ZHJtL2JyaWRnZTogcGFyYWRlLXBzODY0MDogYXZvaWQgcmFjZSBjb25kaXRpb24gb24gZHJpdmVy
IHVuYmluZGluZwogIGRybS9icmlkZ2U6IEFkZCBleHRyYSBjaGVja3MgaW4gcHJlX2VuYWJsZSBh
bmQgcG9zdF9lbmFibGUKCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3BhcmFkZS1wczg2NDAuYyB8
IDYgKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jICAgICAgICAgICB8IDQgKyst
LQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgotLQoy
LjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
