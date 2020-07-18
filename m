Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66A8C433E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 15:35:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B247122C9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 15:35:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NJZkZfHd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="qbIzOJwG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B247122C9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:From:Subject:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ajfj43t0pAQXJQBzRv8ftJlzQDQqM4XwYgIIyjC9XI0=; b=NJZkZfHdA1giFPRCuE988Jtp/F
	DNJEor/NkivbvogWZCuA1uHywrAOJd322gMCvaGDhlRjKkCdfym1obo/VtjfFmhdeJ4tGdgAuI4nx
	cFB0n9BKscvJ9iIYF1eJp8zSv46JrR9KBffjBibOVB4Ki8gdp9iXkAitp5PEOVDQFEKGm8JIYcvXO
	dtGXZKFEVKP0YSYDMVz91he6P6xC7oHss9ZvpThYloEFdoWivGHfcahr/SmW9qPLLMmi1aQb4KoXT
	qDNlbPpZ3tqHWJHrizKVkXUQAPGimCnUs2iHgyhkXJ8YYtqmqAArJ1lElKJalxTCpXR+oNGrq1kAe
	X/ctaSog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxXoi-0001rK-8w; Mon, 20 Jul 2020 15:35:00 +0000
Received: from mout.web.de ([217.72.192.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwoj6-0004Zb-51; Sat, 18 Jul 2020 15:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1595085966;
 bh=IyxbL1zU07mof8eJC+WHF+sz18Phyd5JcwgRAU12by0=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=qbIzOJwGybz4NqB9s8p6jyd/GOA4Vo+BkYPsDO7WnjLxER+uNcUSWiFz9jZgMRosF
 a4LZ6Pz9XGNdl2ElZBCwqQzjESx6axaeLZ924j8EE/HyzOLL4hkES+eqd4BkbF3V6d
 fwKEwAiX/X9MajXWNWL3hGmU8DVOsRNWfBtXuStc=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.120.168]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MWi5i-1kL6o63xhw-00XR95; Sat, 18
 Jul 2020 17:20:11 +0200
To: Navid Emamdoost <navid.emamdoost@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH] mt76: mt76u: add missing release on skb in
 __mt76x02u_mcu_send_msg
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <b480613d-9ff5-79de-1066-2ece999d516d@web.de>
Date: Sat, 18 Jul 2020 17:20:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:69mwo9rNqPcINw1ozFY10lAPovPQK9fXOUGp4GFTTV4tLe/qWC3
 95CqizS015kpzGv03t3bsoeCKGlGnOYYr6IbDDAmVpjnx5+PZhqdAYLPTQNEEqWgO+lcNfY
 1EZ4qFFedVGOoXhHStwW+a/gWENtW0Dk0j+BlxXitWb+FRxQh8+Y3zyfmj3hmGPIpKF1/Sc
 RBUba0mTnAv6FX1DXm3Zw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fRDU2v2aWG0=:DKAZBuilha80imaeP94V6L
 V2OPNYmccdf7itrH/OnSmCReZRHq7T3kxtpD10Sz2yx3iw3r2b6PSo2USjgrhst0a6Oyju9fi
 HxZOZ2pngMo6ewlafucWr1ikNb/4tU4oyrZMT37d+I5O8m5pg+ZVQmPt6CAbgaQB2FbMsW1Wi
 gboBskd+loh1AMdjNSZCyg4aQwudIFUcz/W80BbEEZufFaUZdn27op+hSaOvC3aLd7+b13GzJ
 Z114amijMSr8PopfjhpZib8WWpieFftfNfzcErd+9nzjEOB4it3Kp9EPDLS1iyqoVVBlY1uxM
 PMe91S0//vvpKzBTsWdRt3kXvebdcXWZNP/QdXT+LdctjC/4AIXVWBzXiJ9ogDdy7zGLxUL1f
 6sIRY4fhjRGG2STDhEkcj7eaiTKnjLxDqkSaICiDewOgYcrUuQJ2/fAtoKANX5CnlqyTWN3us
 wOASt+Xl6stOdLsZLYGUGeuMARc1Pz4u6uHI0wOf+jxT+UwawUnBPDrTav+0wX7kPlfBySKP0
 XrCUsdIwikD6JT7epwn5w9TyB/XmMm9FCcYf5oe5mkU+xDo5Hy+GKdAay9xUNgMR1/JeNMVIM
 NzoI4hroGZyP4R6+QacElGoyY50jNkV+sNWRlPDrUgzfMDfP7v1BGOoXMfprJ75/8bihOeMmN
 GIQIUf9PtMnYs6JtLdlDdSBGK4a9qAiC/bpX23Sp7m6Ld1/VmQtUMGkJtfskf6MTfpVkgMpN3
 kS/3hWaHzwnanFxtujAF13X5T3zMylBWYWqU4luNLWEK8XdIlSjSN1nw9N/wgQh1UYneNvPz5
 czihlPCXtuaGIho8LKJ8gHO5BYZtBaQYgNW22+ood+eY46SYkaNy1rUfF3/HOjGd7XvqsXTYv
 VcuojrUcJPMRkiWj+0LaXQg1eL95/GhvcjEpk3dYIApvDdpdAQnyE6AFj7lbgUY0h8gUPOw7l
 6OCoPwPcjyhQIDSI205fXdm9ZTI8KHLwEvGx4X555SWf/hcjZdRTNxhpRBjqgFg3SrOfkO0Lb
 WU57RXr5z/O4+BYZDcympXTj6/5MS34cx3lGGYBOnYUYKyc3emA+HnP9jWrtVCLv7uVQL5KhI
 abWd62w0JLt1TF7fqNv6WQHp30DEg7U9vdReRofdu9PJvu2v2U1gqypyLbbhr3imUrw4pN/i+
 IoqCZu8RpKNUVsS/SQ4A7fTEBkT/r6YaMcPSa/OlHlAJQBuAY0QteLmZW0YGdtmAWoIz7YVZY
 8aJLiOI0GYrIAk631XCE8nePw56EeRXmYZk5zWA==
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_112612_438189_9255A521 
X-CRM114-Status: UNSURE (   7.37  )
X-CRM114-Notice: Please train this message.
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-kernel@vger.kernel.org,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Navid Emamdoost <emamd001@umn.edu>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Kalle Valo <kvalo@codeaurora.org>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

4oCmCj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc2eDAyX3Vz
Yl9tY3UuYwrigKYKPiBAQCAtMTExLDYgKzExMyw3IEBAIF9fbXQ3NngwMnVfbWN1X3NlbmRfbXNn
KHN0cnVjdCBtdDc2X2RldiAqZGV2LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAo+ICAJaWYgKHdhaXRf
cmVzcCkKPiAgCQlyZXQgPSBtdDc2eDAydV9tY3Vfd2FpdF9yZXNwKGRldiwgc2VxKTsKPgo+ICtv
dXQ6Cj4gIAljb25zdW1lX3NrYihza2IpOwrigKYKCkkgc3VnZ2VzdCB0byB1c2UgdGhlIGxhYmVs
IOKAnGNvbnN1bWVfc2ti4oCdLgoKV291bGQgeW91IGxpa2UgdG8gYWRkIHRoZSB0YWcg4oCcRml4
ZXPigJ0gdG8gdGhlIGNvbW1pdCBtZXNzYWdlPwoKUmVnYXJkcywKTWFya3VzCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
