Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E741CC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 07:31:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEF8A23134
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 07:31:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i8IO6plE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="FgeK1KEp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEF8A23134
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qfShuOgKdRKoRdbI/D/Al/z46aTptXzeao/TnStIei0=; b=i8IO6plEjtpLnnyjNKba31VuH
	dqjIKgulI1LyYQv3nViOGeQIW7L3qIe96fW7oxz/oPgEPUIshjGOTlLI/NxNtHKXVycx5gcYbuENF
	/MhGH5td1381PVSr8A9EnwunM5tuwd1Rxz3tTBKn9QSEV94fQOah7kzup7S/wVDD0ek2F4r+PgLyY
	QLaRAgsB1tsKteXk4FsYxET1Dkbck1HBu79nDKdDwe2onWjsy7XKHF00iylTnyQKgT8p9DgcmNImx
	C+E546U3MolpDAib0EFAv/SX/9zlVNsBHI8zWj4CwqC1+IdRhSX4kmSb3Bf8OQXmDRGVblKOKX8wd
	OchKvT0Tg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpoG5-0003kC-AO; Mon, 29 Jun 2020 07:31:17 +0000
Received: from mout.web.de ([212.227.15.3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpoG2-0003jl-Jd; Mon, 29 Jun 2020 07:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1593415860;
 bh=GbckntjVyg40tr+Z4lTM5jcF4Xd3zTNrMbsGyoGGFxM=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=FgeK1KEpoiCapzpwRnmeBkKC5tCP67d0OruMzSSExDRxsUkks0okWvdfHVj16gZVw
 +gv5lR1mjKookpZOX+5ev04LR5esPwLdPcAC/WP/FP119i+0Y3p+NYHrXRrMlOBtYR
 89AVsfS4qRCxqMONVQMnA4AY0yUtmgiB5CPY8oOE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.123.16]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M28WT-1jnKLl1Yy1-002WRb; Mon, 29
 Jun 2020 09:31:00 +0200
Subject: Re: [PATCH 1/2] usb: mtu3: disable USB2 LPM
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felipe Balbi <felipe.balbi@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <1593410434-19406-1-git-send-email-chunfeng.yun@mediatek.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <af16d716-8bb3-ea1f-e410-b27443f74c31@web.de>
Date: Mon, 29 Jun 2020 09:30:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1593410434-19406-1-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-GB
X-Provags-ID: V03:K1:vLXtRvv0TPIyWN9QDTCY3pBL+OVkLjRd48pYastvVAu9WFwnilT
 YDtCWfgtPdH/nhAgtI95ZAX4lZwWqAhT7B131Oiuf21CgY61MSfQ6nm/gvgpBJK8A5jTAik
 83z04u+HTxpKcmn/8++Lyl/HO1nhZEl4ZXwisCHH8XVIY+pvSqXGgxXPR4/dMEQS4IzO6kr
 5QzwFKlMx1ZuvB9MZc+ww==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pWi5sJYuE0Y=:NOT8TlqEmK8Xyam6v8gEl3
 RqD2Sq3jecVf+bnX9tN7pukhPCqzPR3OFKBG85KN/ALWMsHqqtGK0/ckW1uNG8/awqcEAPTt2
 E4KKxqmOPz4fJORSmIy2yGBS3YSfpOez/RPTtce0F+JPnfuIF5fEugWAyMgCNfdxntqyXWzG9
 F7xFM0GUX0qMd2MqNPMz5UG1kEm+R2w69oja5xnQvLvplgm4orbfBYQLH3eYbWnL34Yv5117z
 YFwXr6/YGXzFqwWRyly+HW12LYSEvTx2oeNoMGwyfmdbc31Vsfzg9vbQSJ4u03In2RqqBigCS
 CwmrGtvYyU+NGSiyf/xIxGC8IrPlVvm/s/zuo7F6CL/WrJpTwUWDQB5floUKgUGFOgjb89UyY
 FWlpfYLwFLi43tYpbIS8MLeCiB13VEFrFCUZkZmn3uPCwrTaiPHKThMtCf8FlVnUyPn0FskGf
 x/3lmc6UMUwHbL08ecnF3WdG8zQCqZaQOup2aofO6kMlnkw4bLIzmFW6m6ZkaouBez9dN2n5O
 C+/1xyFgDNOor/hCZMe+OBkE2G1pYVJGKGsT10k6QeaQSYZAnOG4KjtunndMccQA7wULHipV0
 up1Q7NZutT4QhpN1WYT+H8gWmakH6r7JJS6OBwHVQ8ieRvks6UdWYxHd0U0TmaVzCnqonotN0
 sGrkTevVR0SxkrWtatRJcdBvkW7uXO/0R1x2Rtfe0EQzOewm/vb3hP+fcGgxz+3W/TiFoGisg
 iaM7SC0Hv4c6MnKzphLoE4KsVdW+jBZcYEOkL6v5CmqtbDMKF8rWQUBD2tIdKVbotQBVRiNKc
 4YX/zlmrD7MavHjXoFWZtWJeRJ/mLvUm2Z83ZcyGkc0zW7FjVGOyY1jIL5S0AawFIaCqd+x8l
 WHQo0de2vwFmNXvCpXYUXx9QB/jKUfaDWMskc6p/iy3LQPT5pLbw5y5SisT9y/u4f0A/eC2wQ
 AXH3/sSkn4joa0W125h3xOh8sfGBKQ8yV50uarWwAodxYr7x5bV4NfxhrbYvTRg3o/QLqGAhJ
 kVUVCkgbQIAtQjeH3ZWsNLw8uEOTURvTU88DV9sHPK6gjbWCoekmyEOrD+EfoRvcsCHQaiWmz
 RKlXLmoCFrGcrLEUu6/K7Ps+oKFYAGUNhxscMVs8CFSDdmxLsz4OVFzBaXgNfv9Z0lMmIgut8
 rM0lHEWU+N5BuO9uu/aAYvqS+ym9CCymS5y+6yDjPK320vwd7l/TvAqEgX/zXNHrMmYxkIpej
 L12v+6fMCgwEXY+c6
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

PiBBIFN1cGVyU3BlZWQgZGV2aWNlIHNoYWxsIGluY2x1ZGUgdGhlIFVTQiAyLjAgZXh0ZW5zaW9u
IGRlc2NyaXB0b3IKPiBhbmQgc2hhbGwgc3VwcG9ydCBMUE0gd2hlbiBvcGVyYXRpbmcgaW4gVVNC
IDIuMCBIUyBtb2RlKHNlZSB1c2IzLjIKPiBzcGVjOS42LjIuMSkuIEJ1dCB3ZSBhbHdheXMgZG9u
J3Qgc3VwcG9ydCBpdCwgc28gZGlzYWJsZSBpdCBieQo+IGRlZmF1bHQsIG90aGVyd2lzZSBkZXZp
Y2Ugd2lsbCBlbnRlciBMUE0gc3VzcGVuZCBtb2RlIHdoZW4KPiBjb25uZWN0ZWQgdG8gV2luMTAg
c3lzdGVtLgoKSG93IGRvIHlvdSB0aGluayBhYm91dCBhIHdvcmRpbmcgdmFyaWFudCBsaWtlIHRo
ZSBmb2xsb3dpbmc/CgogICBDaGFuZ2UgZGVzY3JpcHRpb246CiAgIEEgU3VwZXJTcGVlZCBkZXZp
Y2Ugc2hhbGwgaW5jbHVkZSB0aGUgVVNCIDIuMCBleHRlbnNpb24gZGVzY3JpcHRvcgogICBhbmQg
c2hhbGwgc3VwcG9ydCBMaW5rIFBvd2VyIE1hbmFnZW1lbnQgd2hlbiBvcGVyYXRpbmcgaW4gVVNC
IDIuMAogICBIaWdoIFNwZWVkIG1vZGUuIChTZWUgYWxzbzogVVNCIDMuMiBzcGVjaWZpY2F0aW9u
IDkuNi4yLjEpCiAgIEJ1dCB3ZSBkbyBub3Qgc3VwcG9ydCBpdCBnZW5lcmFsbHkuIFRodXMgZGlz
YWJsZSB0aGlzIGZ1bmN0aW9uYWxpdHkKICAgYnkgZGVmYXVsdC4KICAgT3RoZXJ3aXNlLCB0aGUg
ZGV2aWNlIHdpbGwgZW50ZXIgTFBNIHN1c3BlbmQgbW9kZSB3aGVuIGNvbm5lY3RlZAogICB0byBX
aW4xMCBzeXN0ZW0uCgoKV291bGQgeW91IGxpa2UgdG8gYWRkIHRoZSB0YWcg4oCcRml4ZXPigJ0g
dG8gdGhlIGNvbW1pdCBtZXNzYWdlPwoKUmVnYXJkcywKTWFya3VzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
