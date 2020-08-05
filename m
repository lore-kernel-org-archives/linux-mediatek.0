Return-Path: <SRS0=PAw8=BP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D26C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 08:46:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51F8421744
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 08:46:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uoUrbhCp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="NwhhO7yJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51F8421744
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LLKe0m+WYJvbgv5bxFLqIRmPUnect8UqkVp6dtFWpxM=; b=uoUrbhCpgpqcV6Tw5KKuLePCK
	HaOo4ejH6OtCkRfY3C+mwWBhTY9epMvd6J2HtElwnwif2HKy2QvCOssdUT648YnzxztD3o3qJjKrI
	JKgb4htydiv5ekEPqA8Hngca7hI11mhq0fRL5qT44RClUM4l46cCR53tzonL3ikhKESb9pwIEjgrE
	0LLyYheINwkTpoME/jaf4ToeoQDSuGY8CXNCtsa5EVQWYXt/5zaaj1pg8MFj7AbItoe8WpIm9Iipv
	0l0HhOlYW2rblk9wSW+2sx0tORiFtB580uXUJMipU4Lbrm39+aU0S7yc38iSyupdkrHXHB5kIaIVQ
	vyN0zSFUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3F3k-0002kS-VA; Wed, 05 Aug 2020 08:46:05 +0000
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3F3h-0002i6-BE; Wed, 05 Aug 2020 08:46:02 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id 3F3Wk0EzyuuXO3F3XkjXt6; Wed, 05 Aug 2020 10:45:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1596617155; bh=E3G95BLyAUJmVusMMfwPa0XjRXL7LH/JhsGHryHhhqk=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=NwhhO7yJ2w0SLPOlQCTV8HVXR3hQzzG8bBAd/ba0hx4r1MDZxJvLxJrSRfpFbHfJ7
 pC6dvxXxPov+DBJUfiIWNvAsqzYcIJ+FbJCflEwJs+iuaTr48ZIZh/H3/cyA3bkypF
 q0oOWJ7auAVO8hiOIxJtoC0ZH8EVug30KAGweyu3TZQaTC1wwdcY4UvY431Gr31zsD
 y0mqAYuy0z3F4nWoSzVEr5DerN5Fb9m0ziv2r85J4ziv9NWwg03YPS88/Ii5HsmG/z
 GCmVJGtat7FD67uivHpRlsQcjz3HXZwQyqvm1WdMea/12If0i3Xj4ftCviGB68E/7Q
 0kXxxSW9KgoQQ==
Subject: Re: [PATCH v11 00/28] Add support for mt2701 JPEG ENC support
To: Xia Jiang <xia.jiang@mediatek.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rick Chang <rick.chang@mediatek.com>
References: <20200804034102.22983-1-xia.jiang@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <dc3d16ad-fd05-5bab-8a16-dc5ba0ef671c@xs4all.nl>
Date: Wed, 5 Aug 2020 10:45:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200804034102.22983-1-xia.jiang@mediatek.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfM7apDStT39H88fUqokBMwpoJPCF/emODIBQNG2aBDzuduKXhUGZyGxV4hNcIqRe1VY8xCHijxo80J9WV3GPg3QX8WtWlOWmC9OxmHAa8gSMTRS6zvb7
 ozMn/nkVzm9eerHLW7F1evmUUnKxklzfb9jl06WuE5hFwg2X/aduIzDWnmnbkKIKCingeCHlQwMlNxCKP9ingl+Ho1ccKha9X76Dm27fef7U4vUPB3uPFRD3
 SDFouRLttkjtidgZnIg7+2h0Qt5ka4rIOR3HqqIR29WRXwUw8RLN1e3tkPXiSUeuzMv3XPe6fzKB3xHKtkRu2duDB+P5G6dNv9oSC/QKiVZP8yzgEul/YhVX
 BvBbD9au2S0ZEYAGwzBYPRqiDQzAy9l7PrUpmjXurd0Q8LQ5fpJoq7fSzegrIFAC2gw6EX6WqNF6PmJoP68nAPdOxxGudJ91X3LwXklUpt0q9q20LMPB+0WK
 0SY5EZREdv4xlEgOJg0MDJqp7UlUXsgYxldnQPQA92VNv9xnov6b/0HRUr4qdPSMFY8weKuspmmoT4Dg4AGosynjxE+rR9213yllcnkbGwMoQbjnMNc8eCNX
 WOoVtGx2x10wTbPLrDekAhr2vEobzycrLDNtHMxrPFq270LiQuPfwsNAoViPVOwTylkn0UrSzhBM4+WQguWxwdaNxP+Hg6tNdYVuEMWh3i48n/K8CUckts1a
 fOS/KoewWfa9D9N3Kh3xpLse7sadizs2u6VyNkoE3Bsb/WOivHbe7HA48IRSGg2VhFiuk3cK8zVtr53QTiBQRLygiLGf3PdhNRvC4APxE7dsDjo8Wn2j2W4E
 SZvx5FEVMse3C1lVoDHYpiqWdypcxUl0nlvgxwFBTzMjTfYoE3rmE28QI++1Fg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_044601_492760_AA46BE09 
X-CRM114-Status: GOOD (  11.88  )
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
Cc: maoguang.meng@mediatek.com, devicetree@vger.kernel.org,
 mojahsu@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 senozhatsky@chromium.org, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMDQvMDgvMjAyMCAwNTo0MCwgWGlhIEppYW5nIHdyb3RlOgo+IFRoaXMgcGF0Y2hzZXQgYWRk
IHN1cHBvcnQgZm9yIG10MjcwMSBKUEVHIEVOQyBzdXBwb3J0LiAgICAgIAoKSSdtIGdldHRpbmcg
dGhlc2UgY29tcGlsZSB3YXJuaW5ncy9lcnJvcnM6Cgpkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210
ay1qcGVnL210a19qcGVnX2NvcmUuYzogSW4gZnVuY3Rpb24g4oCYbXRrX2pwZWdfZW5jX2Rldmlj
ZV9ydW7igJk6CmRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5j
OjkxNzoyNzogd2FybmluZzogdmFyaWFibGUg4oCYanBlZ19zcmNfYnVm4oCZIHNldCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgogIDkxNyB8ICBzdHJ1Y3QgbXRrX2pw
ZWdfc3JjX2J1ZiAqanBlZ19zcmNfYnVmOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXn5+fn5+fn5+fn5+CgpJdCdzIGluZGVlZCBub3QgdXNlZC4KCmRyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jOiBJbiBmdW5jdGlvbiDigJhtdGtfanBlZ19z
dXNwZW5k4oCZOgpkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUu
YzoxNDgyOjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJh2NGwy
X20ybV9zdXNwZW5k4oCZOyBkaWQgeW91IG1lYW4g4oCYdjRsMl9tMm1fbW1hcOKAmT8gWy1XZXJy
b3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCgogMTQ4MiB8ICB2NGwyX20ybV9zdXNw
ZW5kKGpwZWctPm0ybV9kZXYpOwogICAgICB8ICBefn5+fn5+fn5+fn5+fn5+CiAgICAgIHwgIHY0
bDJfbTJtX21tYXAKZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3Jl
LmM6IEluIGZ1bmN0aW9uIOKAmG10a19qcGVnX3Jlc3VtZeKAmToKZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmM6MTQ5NToyOiBlcnJvcjogaW1wbGljaXQgZGVj
bGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYdjRsMl9tMm1fcmVzdW1l4oCZOyBkaWQgeW91IG1lYW4g
4oCYdjRsMl9tMm1fcmVsZWFzZeKAmT8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFy
YXRpb25dCgogMTQ5NSB8ICB2NGwyX20ybV9yZXN1bWUoanBlZy0+bTJtX2Rldik7CiAgICAgIHwg
IF5+fn5+fn5+fn5+fn5+fgogICAgICB8ICB2NGwyX20ybV9yZWxlYXNlCgpUaGlzIGFwcGFyZW50
bHkgcmVsaWVzIG9uIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAx
OTEyMDQxMjQ3MzIuMTA5MzItMi1KZXJyeS1DaC5jaGVuQG1lZGlhdGVrLmNvbS8KClBsZWFzZSBh
ZGQgdGhpcyBwYXRjaCB0byB0aGlzIHNlcmllcy4gRG9uJ3QgZm9yZ2V0IHRvIGFkZCBUb21hc3on
ICdSZXZpZXdlZC1ieScgbGluZS4KCmRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRr
X2pwZWdfY29yZS5jOiBJbiBmdW5jdGlvbiDigJhtdGtfanBlZ19lbmNfZ19zZWxlY3Rpb27igJk6
CmRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jOjUyNTo4OiB3
YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0
aHJvdWdoPV0KCiAgNTI1IHwgICBzLT5yID0gY3R4LT5vdXRfcS5lbmNfY3JvcF9yZWN0OwogICAg
ICB8ICAgfn5+fn5efn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgpkcml2ZXJzL21lZGlhL3BsYXRm
b3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYzo1MjY6Mjogbm90ZTogaGVyZQogIDUyNiB8ICBj
YXNlIFY0TDJfU0VMX1RHVF9DUk9QX0JPVU5EUzoKICAgICAgfCAgXn5+fgoKVGhpcyBpcyBkZWZp
bml0ZWx5IHdyb25nLiBBIGJyZWFrIGlzIG1pc3NpbmcgaGVyZS4KClJlZ2FyZHMsCgoJSGFucwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
