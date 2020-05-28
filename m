Return-Path: <SRS0=oumW=7L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9704C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 16:40:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81A892077D
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 16:40:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SaYcd+h9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="g+g9aK35"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81A892077D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6cW47v71SlMTQNhgACQgj6j1w0s/4mcf3i0MAvPcLds=; b=SaYcd+h962FZF6
	ZDRx7099re9+OkpzZY0yTR4XrBL7VbQ5JKHXG8/S+yqhKq8jTljK4KLjspV9jFJbs51me2ilOoZMD
	CZ68SC/nc4INZZrjAERwGTlk6nrtHDNPfHbdEF14wGqh/L2PDhOO0nBY+xO9IJES8dNmT0xlUPSe/
	o6tISAYInSmsWIpJKyOX6cQThW3VDTwtsozrlXac4IxO5hX8kClN37RV0atAhw0Nmgnkc5FBGS6Xj
	UNle7TFM3YKtV4vKuhce1HmWEgaHyb0M4FQR5g4fNaia168CIish2prINFbkWHeT9/O+wQyvt1yxa
	w2W9L/JQhvwSIIAeweQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jei31-0000pC-GQ; Fri, 29 May 2020 16:39:55 +0000
Received: from mout.web.de ([212.227.15.14])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeM24-0003hk-4e; Thu, 28 May 2020 17:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1590685759;
 bh=p69aR/nzaRPTpqEpuHitn5IvyCINJBKAMa323BW+lFY=;
 h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
 b=g+g9aK35W80VreSFHoYkUcbrmKo3i8elKoo4gS2qujGz4g/zIaT/XIeWEyWvD6AWX
 F5GCTvolFCT8AE1syLLEdTn1HHxzWmQOzwYiiBx4vz9z5ahfZu7DsXgVG021vAXBo+
 jYkQQBNDAba3T1YSuWb5QTHi69j0kbAYi2OeJMbY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([2.244.30.242]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MsJP4-1ikc4q3nPG-00tgiv; Thu, 28
 May 2020 19:09:19 +0200
Subject: Re: [PATCH] Bluetooth: btmtkuart: Improve exception handling in
 btmtuart_probe()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To: Chuhong Yuan <hslester96@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Message-ID: <dd458e1d-26cf-2cc6-4fdb-fb464f9c3ac6@web.de>
Date: Thu, 28 May 2020 19:09:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:HFJVBKBfwx0BNkuJVnzSfsep+qen5ugQ2lnxQrmomHOtQfGba7Z
 rJiWEr4b3kJL2GNgc9vP/hSOvBCEdkSuGQ3jHIVvxslVHZc5VZ/0qNPkKN3UlaAg2VSefSj
 ejdyEEA3yBSElB/TBHtYbcVt2e3tqsCZrEHKSLlmFTcHLUTui1WLpsywmVS7aT484Cx5MlP
 EuPm7xaDFTuFWLXCjZCsw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LZNn0mmb3u0=:6LsgHWgEz2hDXrj8PKKaB+
 U50BTzHMVQh30L6ETjehkxyOXZRwf8wuCYIYMvBU8TV/4hFYjid9h8cJTaONmYr4umbUSc3vP
 GyldNHjjwZxT6LUBujJvU/JtgefcORHdCc31XRo+nLjLKaJQB5O1qlXt4dTHevrOvsH4dZdpR
 cR1FuAusyTes0KtBWEuWgnWy539s8ltkf67JUNGmNK2U3r27nsCQprynQVE09QxcguNGCXq8g
 vXs+hJM9fabWY5PiNwVF+P4A0m+jRYzFjNDwh41dkSy5xz2N1R1b1jdRQViVdPcbMeIqf8W7G
 DyX86uPfk9kc/5lUGDE4Px2n3SCI9FtOxs9roputVg+H9accphilh6t+xgZQ01VlhcD6y95Cq
 ayqdKdlJxg2fZAqW44i506OYQpSpZVZxEXOS4Oh12sxpsDYpp5Lm/B9BKhA2gUj89ioOoa61a
 mstAEa/eUgDYllnvwCXNYHhoFn2o0S3yMbqLG3WkEjSbJvY8mDccQNFKwl2qNcQhNZcDM0LtP
 k5gmO/OxPPh3pF0Q6kJur7876DcEfo4JCWmR4qJCovu8M2nqC62LnrIIKeRhOiDpcVVYXyRzr
 of9w2SNvMJ4sPPxE7vubDU5nMou9gL+jyUZsdUE3+Nz5hPHgHty5MhlUhVZHGIihK7YXbmpcL
 T6asi8L3WdYPW1awMBay9mCa3hMr3cr8F1Js8aDV5Z9Mf5tdLKyGErrUtSpFXbkFs8weMObST
 RAEnaxWMv78xGlz4Gh4JekK2cKzKmbL72EoaQdLJRIADnqTw5bT8EckGyC/CNUWvnJktJSDg+
 pG8BubmpVF2qAGpWMavUtzuP7l2EG0o8vphzEKylV9kxNADg4+FDPsGgg9KNzBllUWEcVHDhq
 PPz+GGNrQhVkOenHkUHMY3XwTa7Pj/Hn/pgxP3Gf1zYofYoM0aWoIeHJdtluI9FrJHkBr6pSp
 7ZVvor7o+xIDXjel1Fy4AM3Ilz8p/DDrJytakNvs27e9rWNyAKlJW0WEwxXLoqGbouWNKqVRG
 Fyn0lqHnMA/M5t85U3ATOTwxNBOVpoT1EkGi9eCTjGacsuFgqHw+7XB/w8sxgQWvOnvK13kFv
 yvVmW7nqvLKxoR09Oz3XRn1Agor+saY6SsXJ05qZQSLZ46Mu09jj4drm48K73bEyu/R2YAUSV
 9LBlmkW2SmcmsdSETolSTsYMHzGgnTdroJ6PeCNTa/itA7S1LMQF920kyVlohc22UwgC1Ikxa
 IZpoYBPXhEiAC5fzc
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_100928_516054_057FD6A2 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 29 May 2020 09:39:54 -0700
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
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>, Sean Wang <sean.wang@mediatek.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

PiBidG10dWFydF9wcm9iZSgpIG1pc3NlcyBzZXZlcmFsIGZ1bmN0aW9uIGNhbGxzIGluIGl0cyBl
cnJvciBwYXRocywKPiBpbmNsdWRpbmcgaGNpX2ZyZWVfZGV2KCkgYW5kIGNsa19kaXNhYmxlX3Vu
cHJlcGFyZSgpLgo+IFJlZmFjdG9yIHRoZSBjb2RlIGFuZCBjYWxsIGNvcnJlY3QgdW5kbyBmdW5j
dGlvbnMgdG8gZml4IHRoZSBlcnJvcgo+IHBhdGhzLgoKSG93IGRvIHlvdSB0aGluayBhYm91dCBh
IHdvcmRpbmcgdmFyaWFudCBsaWtlIHRoZSBmb2xsb3dpbmc/CgogICBDaGFuZ2UgZGVzY3JpcHRp
b246CiAgIENhbGxzIG9mIHRoZSBmdW5jdGlvbnMg4oCcY2xrX2Rpc2FibGVfdW5wcmVwYXJl4oCd
IGFuZCDigJxoY2lfZnJlZV9kZXbigJ0KICAgd2VyZSBtaXNzaW5nIGZvciB0aGUgZXhjZXB0aW9u
IGhhbmRsaW5nLgogICBUaHVzIGFkZCB0aGUgbWlzc2VkIGZ1bmN0aW9uIGNhbGxzIHRvZ2V0aGVy
IHdpdGggY29ycmVzcG9uZGluZwogICBqdW1wIHRhcmdldHMuCgoKV291bGQgeW91IGxpa2UgdG8g
YWRkIHRoZSB0YWcg4oCcRml4ZXPigJ0gdG8gdGhlIGNvbW1pdCBtZXNzYWdlPwoKUmVnYXJkcywK
TWFya3VzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
