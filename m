Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53399C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 09:09:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE43264E25
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 09:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE43264E25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yt8Plwqd1KGVdjSQMBabItWhRnLCsQ6Ulm55xHLxFcI=; b=HZH0hJXqeqS+0DJiJ24awAerc
	mnZFHKYCXxL+wNR4FfQOsUTjrIbv7ZrwSJe0jOwLrCm7wlT47DodudT7+l5CYzzC8jVg7U7/9GVMT
	NeOVkkrVhM0bj64GCI0l1PoKQoPTNs+NotjBq3OLUFe9kkGN+h1e5IxXBsF6asDVGsW5XC4RmgDvZ
	aE8sRpViJ/eP9vglNH8fy3zlnCsOcNFodT2bgJeENuHoematV/MBMEThRdrVb1CFoxspiwB+kyMkI
	eYnv30IfAaPjVhQCZHDGSxMPkxGeng6/THGuo5xAZmHcpimAUObVH+0zapGbmc66kPuLbNy8jdl9g
	m506JeUpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Pm1-0003Ep-TY; Fri, 29 Jan 2021 09:09:01 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Plz-0003EB-EB; Fri, 29 Jan 2021 09:09:00 +0000
Received: from [192.168.0.114] (unknown [49.207.221.54])
 by linux.microsoft.com (Postfix) with ESMTPSA id A73BA20B7192;
 Fri, 29 Jan 2021 01:08:47 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A73BA20B7192
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1611911336;
 bh=zEbtQ5rEHy/dS0FS/n4EtAIZMIOqSB2/eyGBwQkBC6s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Eq8xcESnyCbqMfMvOqeuQg+phUUz+UpfTyhwg01ftz2e7Mb50KG9NphUbI7d1izz9
 HuJfJ8GwgE+r3YgZ5LwfMT9EqiN98IhG+4JepvvHLXMKoUwHdKYyOsIEgEISD1q4s2
 DjHw8ZOHwqVqLInSLZ97zhz51QeGQAbZLwGwGmPU=
Subject: Re: [PATCH v4 01/19] crypto: amcc: convert tasklets to use new
 tasklet_setup() API
To: Herbert Xu <herbert@gondor.apana.org.au>, Allen Pais <allen.lkml@gmail.com>
References: <20210121044126.152274-1-allen.lkml@gmail.com>
 <20210121044126.152274-2-allen.lkml@gmail.com>
 <20210129050551.GA5586@gondor.apana.org.au>
From: Allen Pais <apais@linux.microsoft.com>
Message-ID: <0440823c-39f9-670b-aa1f-a6804e83e99a@linux.microsoft.com>
Date: Fri, 29 Jan 2021 14:38:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210129050551.GA5586@gondor.apana.org.au>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_040859_760651_97CB192C 
X-CRM114-Status: GOOD (  13.87  )
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
 lars.persson@axis.com, matthias.bgg@gmail.com, john.allen@amd.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 linux-crypto@vger.kernel.org, Romain Perier <romain.perier@gmail.com>,
 davem@davemloft.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Cj4+IC0tLQo+PiAgIGRyaXZlcnMvY3J5cHRvL2FtY2MvY3J5cHRvNHh4X2NvcmUuYyB8IDcgKysr
LS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
Cj4gCj4gVGhpcyBkb2Vzbid0IGV2ZW4gY29tcGlsZToKPiAKPiAgICBDQyBbTV0gIGRyaXZlcnMv
Y3J5cHRvL2FtY2MvY3J5cHRvNHh4X2NvcmUubwo+ICAgIENDIFtNXSAgZHJpdmVycy9jcnlwdG8v
YW1jYy9jcnlwdG80eHhfYWxnLm8KPiAgICBDQyBbTV0gIGRyaXZlcnMvY3J5cHRvL2FtY2MvY3J5
cHRvNHh4X3Rybmcubwo+ICAgIENIRUNLICAgLi4vZHJpdmVycy9jcnlwdG8vYW1jYy9jcnlwdG80
eHhfdHJuZy5jCj4gLi4vZHJpdmVycy9jcnlwdG8vYW1jYy9jcnlwdG80eHhfY29yZS5jOiBJbiBm
dW5jdGlvbiDigJhjcnlwdG80eHhfY2lwaGVyX2RvbmXigJk6Cj4gLi4vZHJpdmVycy9jcnlwdG8v
YW1jYy9jcnlwdG80eHhfY29yZS5jOjUyNjoxMzogd2FybmluZzogdmFyaWFibGUg4oCYYWRkcuKA
mSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+ICAgIGRtYV9h
ZGRyX3QgYWRkcjsKPiAgICAgICAgICAgICAgIF5+fn4KPiAuLi9kcml2ZXJzL2NyeXB0by9hbWNj
L2NyeXB0bzR4eF9jb3JlLmM6IEluIGZ1bmN0aW9uIOKAmGNyeXB0bzR4eF9haGFzaF9kb25l4oCZ
Ogo+IC4uL2RyaXZlcnMvY3J5cHRvL2FtY2MvY3J5cHRvNHh4X2NvcmUuYzo1NTc6MjQ6IHdhcm5p
bmc6IHZhcmlhYmxlIOKAmGN0eOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0
LXZhcmlhYmxlXQo+ICAgIHN0cnVjdCBjcnlwdG80eHhfY3R4ICpjdHg7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fgo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSA8Y29tbWFuZC1saW5lPjoK
PiAuLi9kcml2ZXJzL2NyeXB0by9hbWNjL2NyeXB0bzR4eF9jb3JlLmM6IEluIGZ1bmN0aW9uIOKA
mGNyeXB0bzR4eF9iaF90YXNrbGV0X2Ni4oCZOgo+IC4uL2luY2x1ZGUvbGludXgva2VybmVsLmg6
Njk0OjUxOiBlcnJvcjog4oCYc3RydWN0IGRldmljZeKAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKA
mHRhc2tsZXTigJkKPiAgICBCVUlMRF9CVUdfT05fTVNHKCFfX3NhbWVfdHlwZSgqKHB0ciksICgo
dHlwZSAqKTApLT5tZW1iZXIpICYmIFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXn4KClRoYW5rcy4gSXQgc2hvdWxkIGhhdmUgYmVlbgoKCi0t
LSBhL2RyaXZlcnMvY3J5cHRvL2FtY2MvY3J5cHRvNHh4X2NvcmUuYworKysgYi9kcml2ZXJzL2Ny
eXB0by9hbWNjL2NyeXB0bzR4eF9jb3JlLmMKQEAgLTEwNzIsMTAgKzEwNzIsMTEgQEAgc3RhdGlj
IHZvaWQgY3J5cHRvNHh4X3VucmVnaXN0ZXJfYWxnKHN0cnVjdCAKY3J5cHRvNHh4X2RldmljZSAq
c2VjX2RldikKICAgICAgICAgfQogIH0KCi1zdGF0aWMgdm9pZCBjcnlwdG80eHhfYmhfdGFza2xl
dF9jYih1bnNpZ25lZCBsb25nIGRhdGEpCitzdGF0aWMgdm9pZCBjcnlwdG80eHhfYmhfdGFza2xl
dF9jYihzdHJ1Y3QgdGFza2xldF9zdHJ1Y3QgKnQpCiAgewotICAgICAgIHN0cnVjdCBkZXZpY2Ug
KmRldiA9IChzdHJ1Y3QgZGV2aWNlICopZGF0YTsKLSAgICAgICBzdHJ1Y3QgY3J5cHRvNHh4X2Nv
cmVfZGV2aWNlICpjb3JlX2RldiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOworICAgICAgIHN0cnVj
dCBjcnlwdG80eHhfY29yZV9kZXZpY2UgKmNvcmVfZGV2ID0gZnJvbV90YXNrbGV0KGNvcmVfZGV2
LCB0LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHRhc2tsZXQpOworICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9IGNvcmVfZGV2
LT5kZXZpY2U7CiAgICAgICAgIHN0cnVjdCBwZF91aW5mbyAqcGRfdWluZm87CiAgICAgICAgIHN0
cnVjdCBjZV9wZCAqcGQ7CiAgICAgICAgIHUzMiB0YWlsID0gY29yZV9kZXYtPmRldi0+cGRyX3Rh
aWw7CkBAIC0xNDUyLDggKzE0NTMsNyBAQCBzdGF0aWMgaW50IGNyeXB0bzR4eF9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlIAoqb2ZkZXYpCiAgICAgICAgICAgICAgICAgZ290byBlcnJfYnVp
bGRfc2RyOwoKICAgICAgICAgLyogSW5pdCB0YXNrbGV0IGZvciBib3R0b20gaGFsZiBwcm9jZXNz
aW5nICovCi0gICAgICAgdGFza2xldF9pbml0KCZjb3JlX2Rldi0+dGFza2xldCwgY3J5cHRvNHh4
X2JoX3Rhc2tsZXRfY2IsCi0gICAgICAgICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nKSBkZXYp
OworICAgICAgIHRhc2tsZXRfc2V0dXAoJmNvcmVfZGV2LT50YXNrbGV0LCBjcnlwdG80eHhfYmhf
dGFza2xldF9jYik7CgogICAgICAgICBjb3JlX2Rldi0+ZGV2LT5jZV9iYXNlID0gb2ZfaW9tYXAo
b2ZkZXYtPmRldi5vZl9ub2RlLCAwKTsKICAgICAgICAgaWYgKCFjb3JlX2Rldi0+ZGV2LT5jZV9i
YXNlKSB7CgoKV2lsbCBmaXggaXQgdXAgYW5kIHJlLXNlbmQuCgpUaGFua3MuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
