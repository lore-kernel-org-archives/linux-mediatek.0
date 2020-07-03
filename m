Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681B7C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 17:42:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EC1B2084C
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 17:42:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cfwpn9bh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DiTMT+9T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EC1B2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1FyrwHZ4ZfW4m4oMNXJ6SdiWk3SKwjSrHfW593WP3Cg=; b=cfwpn9bhoAOPXgMh+lOitV7P3
	Tp1+JInDKpePhRgHu5b57E4/v/7bL69NuGWVck3lOQL8d5hBBK/pMFd9dIzAmW4e6odx+xlkHUt+O
	/aqIbBEP/htxZefwRHHCsyKlLgS1RNuSORuuAb3zkqhyIVjF3ZXWpvX2/z3kmcS9ejqfF+LEjFTod
	05i+OAcnT7s7HcLCnHp83VIBhzyFlNsyYAXxRxEUCvDpUXWBkSy/0AP6sspaWz1XWYGtM+v088z2q
	zeUWz5XDzfi3vPyyk6je5GiB+hrsSe/Sw36vmFqP9F+YS6GUqLo8817suvks3DyKC8DQ4bycXf8JT
	k7Y+xxZeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrPhN-0001tT-Tp; Fri, 03 Jul 2020 17:42:05 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrPhG-0001qg-MN
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 17:41:59 +0000
Received: by mail-wm1-x342.google.com with SMTP id j18so32752648wmi.3
 for <linux-mediatek@lists.infradead.org>; Fri, 03 Jul 2020 10:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YSysemk6/m3rdKU2ySMi9uU8qYuK0kuhW6Pw5qHpSnI=;
 b=DiTMT+9THBotFZ8hAPsnuIbDSlmH+WPn87U6MQV2wdUqBmGs3uF0tKCXEfU7478vwj
 hwRiHYDh4JpRpasNgymyRlZRKZYPomrYM9TJPmqWfJcxMLGduvnehwmmmjtysVHuv640
 iQFbD58SHTQRqL/gBV171cuR8/WTeYhTRVk7h0EI46cXLbxvMZRbUIA5L7SH2rCkEbw6
 NET+ildSzhaQAlJxNoSvdavC9aTyR7AzdS74FkZ+BefFZx0zPt+xwBXdSFYStsHg0rDd
 ky0+csRp4oiOhk+Bjw68pqKMRSCnHLd+2J+YF8NR5NMSJyMbowwOIgMWQhjToihJ5crY
 Azhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YSysemk6/m3rdKU2ySMi9uU8qYuK0kuhW6Pw5qHpSnI=;
 b=hHkhWzn9AQguMJQe+WOhpskmAHjEAS++S/QJJ2pH3ciQA+T/5sIq7HlHjdJdHoZqWe
 dxPZv0wqcD0iNK7PBdYn3JDQiJjyQj2uuhc5pb2BANwTvtA3otF+JR/J9H9UMR8sI2+S
 U62PgXBNuIfxlI4JD5t+Tjpx4KXWikx4VYzBOvV5nt2MLbKtVMKlupIX9aY+gqtTpLhV
 O/8o4MSXyNwQVb2wN1Aw1tkBVeCQiAvNjlqtuaa0AzU8r4C6oAu0gsTH4N7lIs6yaO31
 1Jme5SD9Si4BPZE5u8NL/AGPDmT6HCS/7uetsPOlZF6M2bBKZKmD9f+yhNQgy1LIk1QP
 CW5g==
X-Gm-Message-State: AOAM5303ye8+UYl1gs5tk3ln36HZf+kJfqVYizUtXJqB10SGDhddbC0W
 mup+KRBsQ2gLPcCIJh12pi5V+w==
X-Google-Smtp-Source: ABdhPJwq6EJ8i4c07CyyjVONmZU0HR1br30HC+HrU3hY5Q/iNyS39dh2n8CRaJSQcQXq5fDuEcoNRg==
X-Received: by 2002:a1c:9a02:: with SMTP id c2mr8726718wme.16.1593798117749;
 Fri, 03 Jul 2020 10:41:57 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 10:41:57 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 01/30] usb: mtu3: mtu3_debug: Add forward declaration of
 'struct ssusb_mtk'
Date: Fri,  3 Jul 2020 18:41:19 +0100
Message-Id: <20200703174148.2749969-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703174148.2749969-1-lee.jones@linaro.org>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_134158_795850_171CA908 
X-CRM114-Status: GOOD (  11.12  )
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
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

V2l0aG91dCBpdCwgdGhlIGJ1aWxkIHN5c3RlbSBjb21wbGFpbnMgdGhhdCBpdCB3YXMgZGVjbGFy
ZWQgaW5zaWRlCnRoZSBwYXJhbWV0ZXIgbGlzdC4KCkZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtl
cm5lbCBidWlsZCB3YXJuaW5nKHMpOgoKIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL3Vz
Yi9tdHUzL210dTNfdHJhY2UuYzoxMToKIGRyaXZlcnMvdXNiL210dTMvbXR1M19kZWJ1Zy5oOjI5
OjM2OiB3YXJuaW5nOiDigJhzdHJ1Y3Qgc3N1c2JfbXRr4oCZIGRlY2xhcmVkIGluc2lkZSBwYXJh
bWV0ZXIgbGlzdCB3aWxsIG5vdCBiZSB2aXNpYmxlIG91dHNpZGUgb2YgdGhpcyBkZWZpbml0aW9u
IG9yIGRlY2xhcmF0aW9uCiAyOSB8IHZvaWQgc3N1c2JfZGV2X2RlYnVnZnNfaW5pdChzdHJ1Y3Qg
c3N1c2JfbXRrICpzc3VzYik7CiB8IF5+fn5+fn5+fgogZHJpdmVycy91c2IvbXR1My9tdHUzX2Rl
YnVnLmg6MzA6MzU6IHdhcm5pbmc6IOKAmHN0cnVjdCBzc3VzYl9tdGvigJkgZGVjbGFyZWQgaW5z
aWRlIHBhcmFtZXRlciBsaXN0IHdpbGwgbm90IGJlIHZpc2libGUgb3V0c2lkZSBvZiB0aGlzIGRl
ZmluaXRpb24gb3IgZGVjbGFyYXRpb24KIDMwIHwgdm9pZCBzc3VzYl9kcl9kZWJ1Z2ZzX2luaXQo
c3RydWN0IHNzdXNiX210ayAqc3N1c2IpOwogfCBefn5+fn5+fn4KIGRyaXZlcnMvdXNiL210dTMv
bXR1M19kZWJ1Zy5oOjMxOjM5OiB3YXJuaW5nOiDigJhzdHJ1Y3Qgc3N1c2JfbXRr4oCZIGRlY2xh
cmVkIGluc2lkZSBwYXJhbWV0ZXIgbGlzdCB3aWxsIG5vdCBiZSB2aXNpYmxlIG91dHNpZGUgb2Yg
dGhpcyBkZWZpbml0aW9uIG9yIGRlY2xhcmF0aW9uCiAzMSB8IHZvaWQgc3N1c2JfZGVidWdmc19j
cmVhdGVfcm9vdChzdHJ1Y3Qgc3N1c2JfbXRrICpzc3VzYik7CiB8IF5+fn5+fn5+fgogZHJpdmVy
cy91c2IvbXR1My9tdHUzX2RlYnVnLmg6MzI6Mzk6IHdhcm5pbmc6IOKAmHN0cnVjdCBzc3VzYl9t
dGvigJkgZGVjbGFyZWQgaW5zaWRlIHBhcmFtZXRlciBsaXN0IHdpbGwgbm90IGJlIHZpc2libGUg
b3V0c2lkZSBvZiB0aGlzIGRlZmluaXRpb24gb3IgZGVjbGFyYXRpb24KIDMyIHwgdm9pZCBzc3Vz
Yl9kZWJ1Z2ZzX3JlbW92ZV9yb290KHN0cnVjdCBzc3VzYl9tdGsgKnNzdXNiKTsKIHwgXn5+fn5+
fn5+CgpDYzogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPgpDYzogbGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvdXNiL210dTMvbXR1M19kZWJ1Zy5o
IHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdXNiL210dTMvbXR1M19kZWJ1Zy5oIGIvZHJpdmVycy91c2IvbXR1My9tdHUzX2RlYnVn
LmgKaW5kZXggZmI2YjI4Mjc3YzliMS4uMzA4NGM0NjAxN2MzNyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy91c2IvbXR1My9tdHUzX2RlYnVnLmgKKysrIGIvZHJpdmVycy91c2IvbXR1My9tdHUzX2RlYnVn
LmgKQEAgLTEyLDYgKzEyLDggQEAKIAogI2luY2x1ZGUgPGxpbnV4L2RlYnVnZnMuaD4KIAorc3Ry
dWN0IHNzdXNiX210azsKKwogI2RlZmluZSBNVFUzX0RFQlVHRlNfTkFNRV9MRU4gMzIKIAogc3Ry
dWN0IG10dTNfcmVnc2V0IHsKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
