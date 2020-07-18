Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D65E9C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 15:35:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1E0422B4E
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 15:35:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UAFMrioZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="oU+m9PD+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1E0422B4E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:From:Subject:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ll0D1B9zdRO+jOyc0AWI/R9NTDLX5FOQDNhdn48m4hQ=; b=UAFMrioZQ45RCYQtWCTmz8cwDP
	zJDf+DTH5yrkiLEP5BPMKDk+rQ3rWIyfHdwgYXGqP0v4DGQiOsg8mIFhhTD7Yp37cFaIzYGCIzACf
	Xg47Ye+LWkFXIKeppRS2zk52yvd1xgFM/jpniJN6mSMBRJ6FPlotjVGpXnezjlsEc86aTVI2hKMdd
	BKHU1Mm3z8CorGiQiHA+sVE7BrLpiKm1NLk1da4I8n8HozgO5yLACccxPPlZZ8zZY5vxV4+UNbtZp
	43d0bG7NE2A7ZV/ZXTKo13yLRjqmSyaxxOmVggxRsNxftOzh1tz1kzNLGmTeN5nn5l7kBd6/q/jNA
	IFv0mNDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxXoh-0001rD-TW; Mon, 20 Jul 2020 15:34:59 +0000
Received: from mout.web.de ([212.227.17.12])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwo9T-0005VA-FE; Sat, 18 Jul 2020 14:49:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1595083735;
 bh=yi6X3Espd5sqSuTZxmewLW+HuDxFJ98WpdvVZq3n+xo=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=oU+m9PD+nRG+MaaKhAGUrVmXlvBn7KIetTTOXuZ6hoFzoz1qRqrpVHQh2iX1N+5Pr
 hJxehk4LPWQkTcm7a3S5H5DqkOc6ynQh1jwAPSO+iL7mCSWF18hAe2YV8xornUxCJg
 uWFY1lWfu68qX2P6MlAJdKyN/qpoCSquD6VRs+l4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.120.168]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MbTL1-1kY3dm2yVd-00bVdw; Sat, 18
 Jul 2020 16:48:55 +0200
To: Navid Emamdoost <navid.emamdoost@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH] mt7601u: add missing release on skb in
 mt7601u_mcu_msg_send
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <080cc1d6-cbe2-65c7-fc78-861292bd46b9@web.de>
Date: Sat, 18 Jul 2020 16:48:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:xGd5zp427AZNVcvL0N6vop3uRwIGOzf5KsveZJhnWmHKhgAIkQK
 6FoGgX2XGpgWjbbxfvlxFwEz9IzDY0ue5YQTXPbMJ9aNrrXuM+ucI5oVQ4RE6/wybsu1FaE
 D+LUzkoOv9OFlatbzVFtGNd57az+LbgFQFLc2LtK7HMiYr9GyDPs3+6VcqYBEwmAWTTEN0l
 L4pSOGpiURVIxdwG55FhQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MC+N+UBDk9E=:8iDVDj7jP1s7OiZ2PhbEBO
 zIelheL8VSespmvapmnRtGe5WeHQi2/Xi426hQ3lICgpTAv8Q/9W6N8f8aAZaJporxL284yec
 m7O2LFBMlVWlBxyOIgCcpO3GhX/yl3D6fFRwpPqx50dRULSi7dsWq5NO6BJIdvFEEv0C4nvuF
 twEsyQmzXWKCo1Qx10GUCqEbov2pHB5vLy5NCZIGIITfL2aMS/l6NPTVmg3TVetWqon4prBD8
 iT7zYIQzkbq9AJFEyR4jHrSqjhXmmZMJGrDjJ9OHPXCjGl1Yk3bDuu9X65mMcXa6un7wRExC3
 yiy3MtxvO96dvaJJ+NuTEs1WRDRNGipPe5LWhXRudaW0uAfrpFadn/kDBJnTfdnMA3Y2eGDAv
 8D+SC3FtZzb1xKUM967wwmwrAzqRSu9XQkDSGIp19jeRljL1EECAlGsPtv1uN/jLhjtQ69Oq1
 53kvvN9tLAdtUJdYpoS+AeuCKBWXtV6wUAu67Bkp2Sh+9ZW/+fXa/dpvIl1VbMOLRIIAQQYlL
 3Uy5P8uuTMLNPEddkZrXimWpCqIpMTUs69j/5h7WR4+BxWRDHoQgUdOT3OsDqru3LhJI/Lqjj
 0KgUgs2dwGFqlS1f+HrMd1izz2rBK5ySxqpeChY3XqJg57vRYzyVHCoifVsCnxf4g4rVQGyMC
 paZ+B8rUpCpH732KXQWTgETVv8dl439I3LNPi9xMJxfHoojkXNmMiBtXCQc/Ju+Z4qH5/Pjhx
 OItC0yTCuAC/OZuXQR39nbCj78kG4gJoo4NCtMBYdixuKKEjvBFwzyLdK531z2DXDfbU2vtIW
 6QYBZ3HADHr+lsTWCuZCaQtw/xFZ6UfQWYULkJG8GtsyWy90Ligmv3x9C1llgIJQf9YrqjH9Z
 73Ah2p/AckbRQImTo659ls+GzoqjS2iSSBXoBjIj4TUQAjcOBB5Diq/zcyxp3E8HRwWJYMMgh
 md5mRe6x35pgB+IclfX5/6J1jg57iKhSL7yf/MXYdN0eVWY+8p3UhEdfbGLZds0uU5EkeEVvg
 5p1ElXiPG/2U1zd9LaMTZQtOiC5HzLbSelVOTbUYC5pgS44X3Vu84gJyxxITiHj7IfUAskVPA
 frWahzqCqBgW+ZTRWfS/zJfliM0xPZ+Koasx2CMmG0rQmEMGkfejYtPVWkusfrkaZ05LKG7I9
 +C45fcowqbn1yEMlBDZ2ScbiSiHj60Qfz4y2Soz0RZ0JcFJTNjLBEZGYfccOaGunIj1m4XGZo
 5yFlA0hjr5nNAB5Yypn/P3p8UdtvxyO1B+a4abQ==
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_104923_726660_761500BE 
X-CRM114-Status: GOOD (  10.55  )
X-Mailman-Approved-At: Mon, 20 Jul 2020 11:34:58 -0400
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
Cc: Jakub Kicinski <kubakici@wp.pl>, linux-kernel@vger.kernel.org,
 Navid Emamdoost <emamd001@umn.edu>, Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

4oCmCj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3NjAxdS9tY3UuYwo+
IEBAIC0xMTYsOCArMTE2LDEwIEBAIG10NzYwMXVfbWN1X21zZ19zZW5kKHN0cnVjdCBtdDc2MDF1
X2RldiAqZGV2LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAo+ICAJaW50IHNlbnQsIHJldDsKPiAgCXU4
IHNlcSA9IDA7Cj4KPiAtCWlmICh0ZXN0X2JpdChNVDc2MDFVX1NUQVRFX1JFTU9WRUQsICZkZXYt
PnN0YXRlKSkKPiArCWlmICh0ZXN0X2JpdChNVDc2MDFVX1NUQVRFX1JFTU9WRUQsICZkZXYtPnN0
YXRlKSkgewo+ICsJCWNvbnN1bWVfc2tiKHNrYik7Cj4gIAkJcmV0dXJuIDA7Cj4gKwl9CuKApgoK
SG93IGRvIHlvdSB0aGluayBhYm91dCB0byB1c2UgdGhlIHRoZSBmb2xsb3dpbmcgc3RhdGVtZW50
cyBpbnN0ZWFkCmluIHRoZSBpZiBicmFuY2g/CgoJCXJldCA9IDA7CgkJZ290byBjb25zdW1lX3Nr
YjsKCgpXb3VsZCB5b3UgbGlrZSB0byBhZGQgdGhlIHRhZyDigJxGaXhlc+KAnSB0byB0aGUgY29t
bWl0IG1lc3NhZ2U/CgpSZWdhcmRzLApNYXJrdXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
