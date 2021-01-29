Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CFEC433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 05:07:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB19264DFF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 05:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB19264DFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RJFfysnWO2BokI2pFQt+ZwMk6Zdi1cxLyhn1feCfL4k=; b=OwGk/Byrtes4ea5OeOI3Y7uPb
	wVaTqIHycRTEpZzCjtZSmyXDgi8hucCaTYFSq771EaQLnn468s9FCvVmCkflU0jQ3ZKFNBvVCwAs2
	f4o8jUq/MP/nb95Fwu+Eu/r1zYWZuAUCCWKbObm4FHUBTtUk89Ln9TdpJO7ZV9Y93ep1ffr8WMjWu
	upMXjSY8ujv0lHgOQYQ5R0IrrnGh26AhNhBMMZtDg99t7tvkYlMzvxWwswiLmTJ1MeVvn65Bd72Qd
	CIYbk+Q1pnfIRKHL7ZRJlcbICGvAOvzcOMCdXTGkZjrS+k2BvKZtP5rrSRwtYP8h8AXbt6nD9Kxkk
	XyPD2csSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Lzy-0007IB-3q; Fri, 29 Jan 2021 05:07:10 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=fornost.hmeau.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Lzv-0007H9-Np; Fri, 29 Jan 2021 05:07:09 +0000
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1l5Lyi-00027x-FU; Fri, 29 Jan 2021 16:05:53 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 29 Jan 2021 16:05:52 +1100
Date: Fri, 29 Jan 2021 16:05:52 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Allen Pais <allen.lkml@gmail.com>
Subject: Re: [PATCH v4 01/19] crypto: amcc: convert tasklets to use new
 tasklet_setup() API
Message-ID: <20210129050551.GA5586@gondor.apana.org.au>
References: <20210121044126.152274-1-allen.lkml@gmail.com>
 <20210121044126.152274-2-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210121044126.152274-2-allen.lkml@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_000707_793846_288F90C6 
X-CRM114-Status: GOOD (  11.45  )
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
Cc: giovanni.cabiddu@intel.com, alexandre.belloni@bootlin.com,
 aymen.sghaier@nxp.com, heiko@sntech.de, qat-linux@intel.com,
 jamie@jamieiles.com, jesper.nilsson@axis.com,
 linux-samsung-soc@vger.kernel.org, horia.geanta@nxp.com,
 k.konieczny@samsung.com, schalla@marvell.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, ludovic.desroches@microchip.com,
 thomas.lendacky@amd.com, arno@natisbad.org, vz@mleia.com, gilad@benyossef.com,
 gcherian@marvell.com, linux-mediatek@lists.infradead.org,
 lars.persson@axis.com, matthias.bgg@gmail.com,
 Allen Pais <apais@linux.microsoft.com>, john.allen@amd.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 linux-crypto@vger.kernel.org, Romain Perier <romain.perier@gmail.com>,
 davem@davemloft.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKYW4gMjEsIDIwMjEgYXQgMTA6MTE6MDhBTSArMDUzMCwgQWxsZW4gUGFpcyB3cm90
ZToKPiBGcm9tOiBBbGxlbiBQYWlzIDxhcGFpc0BsaW51eC5taWNyb3NvZnQuY29tPgo+IAo+IElu
IHByZXBhcmF0aW9uIGZvciB1bmNvbmRpdGlvbmFsbHkgcGFzc2luZyB0aGUKPiBzdHJ1Y3QgdGFz
a2xldF9zdHJ1Y3QgcG9pbnRlciB0byBhbGwgdGFza2xldAo+IGNhbGxiYWNrcywgc3dpdGNoIHRv
IHVzaW5nIHRoZSBuZXcgdGFza2xldF9zZXR1cCgpCj4gYW5kIGZyb21fdGFza2xldCgpIHRvIHBh
c3MgdGhlIHRhc2tsZXQgcG9pbnRlciBleHBsaWNpdGx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJv
bWFpbiBQZXJpZXIgPHJvbWFpbi5wZXJpZXJAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFs
bGVuIFBhaXMgPGFwYWlzQGxpbnV4Lm1pY3Jvc29mdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvY3J5
cHRvL2FtY2MvY3J5cHRvNHh4X2NvcmUuYyB8IDcgKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKVGhpcyBkb2Vzbid0IGV2ZW4gY29tcGls
ZToKCiAgQ0MgW01dICBkcml2ZXJzL2NyeXB0by9hbWNjL2NyeXB0bzR4eF9jb3JlLm8KICBDQyBb
TV0gIGRyaXZlcnMvY3J5cHRvL2FtY2MvY3J5cHRvNHh4X2FsZy5vCiAgQ0MgW01dICBkcml2ZXJz
L2NyeXB0by9hbWNjL2NyeXB0bzR4eF90cm5nLm8KICBDSEVDSyAgIC4uL2RyaXZlcnMvY3J5cHRv
L2FtY2MvY3J5cHRvNHh4X3RybmcuYwouLi9kcml2ZXJzL2NyeXB0by9hbWNjL2NyeXB0bzR4eF9j
b3JlLmM6IEluIGZ1bmN0aW9uIOKAmGNyeXB0bzR4eF9jaXBoZXJfZG9uZeKAmToKLi4vZHJpdmVy
cy9jcnlwdG8vYW1jYy9jcnlwdG80eHhfY29yZS5jOjUyNjoxMzogd2FybmluZzogdmFyaWFibGUg
4oCYYWRkcuKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQog
IGRtYV9hZGRyX3QgYWRkcjsKICAgICAgICAgICAgIF5+fn4KLi4vZHJpdmVycy9jcnlwdG8vYW1j
Yy9jcnlwdG80eHhfY29yZS5jOiBJbiBmdW5jdGlvbiDigJhjcnlwdG80eHhfYWhhc2hfZG9uZeKA
mToKLi4vZHJpdmVycy9jcnlwdG8vYW1jYy9jcnlwdG80eHhfY29yZS5jOjU1NzoyNDogd2Fybmlu
ZzogdmFyaWFibGUg4oCYY3R44oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQt
dmFyaWFibGVdCiAgc3RydWN0IGNyeXB0bzR4eF9jdHggKmN0eDsKICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+CkluIGZpbGUgaW5jbHVkZWQgZnJvbSA8Y29tbWFuZC1saW5lPjoKLi4vZHJpdmVy
cy9jcnlwdG8vYW1jYy9jcnlwdG80eHhfY29yZS5jOiBJbiBmdW5jdGlvbiDigJhjcnlwdG80eHhf
YmhfdGFza2xldF9jYuKAmToKLi4vaW5jbHVkZS9saW51eC9rZXJuZWwuaDo2OTQ6NTE6IGVycm9y
OiDigJhzdHJ1Y3QgZGV2aWNl4oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYdGFza2xldOKAmQog
IEJVSUxEX0JVR19PTl9NU0coIV9fc2FtZV90eXBlKCoocHRyKSwgKCh0eXBlICopMCktPm1lbWJl
cikgJiYgXAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBefgouLy4uL2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDozMDY6OTogbm90ZTogaW4g
ZGVmaW5pdGlvbiBvZiBtYWNybyDigJhfX2NvbXBpbGV0aW1lX2Fzc2VydOKAmQogICBpZiAoIShj
b25kaXRpb24pKSAgICAgXAogICAgICAgICBefn5+fn5+fn4KLi8uLi9pbmNsdWRlL2xpbnV4L2Nv
bXBpbGVyX3R5cGVzLmg6MzI2OjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhfY29t
cGlsZXRpbWVfYXNzZXJ04oCZCiAgX2NvbXBpbGV0aW1lX2Fzc2VydChjb25kaXRpb24sIG1zZywg
X19jb21waWxldGltZV9hc3NlcnRfLCBfX0NPVU5URVJfXykKICBefn5+fn5+fn5+fn5+fn5+fn5+
Ci4uL2luY2x1ZGUvbGludXgvYnVpbGRfYnVnLmg6Mzk6Mzc6IG5vdGU6IGluIGV4cGFuc2lvbiBv
ZiBtYWNybyDigJhjb21waWxldGltZV9hc3NlcnTigJkKICNkZWZpbmUgQlVJTERfQlVHX09OX01T
Ryhjb25kLCBtc2cpIGNvbXBpbGV0aW1lX2Fzc2VydCghKGNvbmQpLCBtc2cpCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn4KLi4vaW5jbHVkZS9s
aW51eC9rZXJuZWwuaDo2OTQ6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEJVSUxE
X0JVR19PTl9NU0figJkKICBCVUlMRF9CVUdfT05fTVNHKCFfX3NhbWVfdHlwZSgqKHB0ciksICgo
dHlwZSAqKTApLT5tZW1iZXIpICYmIFwKICBefn5+fn5+fn5+fn5+fn5+Ci4uL2luY2x1ZGUvbGlu
dXgva2VybmVsLmg6Njk0OjIwOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYX19zYW1l
X3R5cGXigJkKICBCVUlMRF9CVUdfT05fTVNHKCFfX3NhbWVfdHlwZSgqKHB0ciksICgodHlwZSAq
KTApLT5tZW1iZXIpICYmIFwKICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fgouLi9pbmNs
dWRlL2xpbnV4L2ludGVycnVwdC5oOjY0NjoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g
4oCYY29udGFpbmVyX29m4oCZCiAgY29udGFpbmVyX29mKGNhbGxiYWNrX3Rhc2tsZXQsIHR5cGVv
ZigqdmFyKSwgdGFza2xldF9maWVsZG5hbWUpCiAgXn5+fn5+fn5+fn5+Ci4uL2RyaXZlcnMvY3J5
cHRvL2FtY2MvY3J5cHRvNHh4X2NvcmUuYzoxMDc4OjIzOiBub3RlOiBpbiBleHBhbnNpb24gb2Yg
bWFjcm8g4oCYZnJvbV90YXNrbGV04oCZCiAgc3RydWN0IGRldmljZSAqZGV2ID0gZnJvbV90YXNr
bGV0KGRldiwgdCwgdGFza2xldCk7CiAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+
Ci4vLi4vaW5jbHVkZS9saW51eC9jb21waWxlcl90eXBlcy5oOjE0NjozNTogZXJyb3I6IOKAmHN0
cnVjdCBkZXZpY2XigJkgaGFzIG5vIG1lbWJlciBuYW1lZCDigJh0YXNrbGV04oCZCiAjZGVmaW5l
IF9fY29tcGlsZXJfb2Zmc2V0b2YoYSwgYikgX19idWlsdGluX29mZnNldG9mKGEsIGIpCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+Ci4uL2luY2x1
ZGUvbGludXgvc3RkZGVmLmg6MTc6MzI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhf
X2NvbXBpbGVyX29mZnNldG9m4oCZCiAjZGVmaW5lIG9mZnNldG9mKFRZUEUsIE1FTUJFUikgX19j
b21waWxlcl9vZmZzZXRvZihUWVBFLCBNRU1CRVIpCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fgouLi9pbmNsdWRlL2xpbnV4L2tlcm5lbC5oOjY5Nzoy
MTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmG9mZnNldG9m4oCZCiAgKCh0eXBlICop
KF9fbXB0ciAtIG9mZnNldG9mKHR5cGUsIG1lbWJlcikpKTsgfSkKICAgICAgICAgICAgICAgICAg
ICAgXn5+fn5+fn4KLi4vaW5jbHVkZS9saW51eC9pbnRlcnJ1cHQuaDo2NDY6Mjogbm90ZTogaW4g
ZXhwYW5zaW9uIG9mIG1hY3JvIOKAmGNvbnRhaW5lcl9vZuKAmQogIGNvbnRhaW5lcl9vZihjYWxs
YmFja190YXNrbGV0LCB0eXBlb2YoKnZhciksIHRhc2tsZXRfZmllbGRuYW1lKQogIF5+fn5+fn5+
fn5+fgouLi9kcml2ZXJzL2NyeXB0by9hbWNjL2NyeXB0bzR4eF9jb3JlLmM6MTA3ODoyMzogbm90
ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmGZyb21fdGFza2xldOKAmQogIHN0cnVjdCBkZXZp
Y2UgKmRldiA9IGZyb21fdGFza2xldChkZXYsIHQsIHRhc2tsZXQpOwogICAgICAgICAgICAgICAg
ICAgICAgIF5+fn5+fn5+fn5+fgoKVGhhbmtzLAotLSAKRW1haWw6IEhlcmJlcnQgWHUgPGhlcmJl
cnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4KSG9tZSBQYWdlOiBodHRwOi8vZ29uZG9yLmFwYW5hLm9y
Zy5hdS9+aGVyYmVydC8KUEdQIEtleTogaHR0cDovL2dvbmRvci5hcGFuYS5vcmcuYXUvfmhlcmJl
cnQvcHVia2V5LnR4dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
