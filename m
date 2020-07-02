Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F40C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 14:50:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB8D020772
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 14:50:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vVw7Iv1P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dq/N0zwq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB8D020772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0/fnC98k9H11jG5KdhiGP6eZMiqD3DRj389ividcqLg=; b=vVw7Iv1PN6CaF+ccfjL+hIjx5
	xN9OH2U4MlFj0SptgW88xsSTz79J5glqwg2Pwf7Hxspjl+aFB7Nbr1crVopX15V+pa4WyvyyoxMQV
	pLKry7CHtBMdUaz5SClmlgZP8DxXFCmd2f2SAep7SW6+eaKBgz6UzhHz893/2X1eMu7KshX4GAl7Z
	fpihnEM4g83F96YTNUfe9jBpvPfwITeskB+Sk8Kqq8oqEG5SFbAVGGCZaH5GhlXA7QycHGQ39e0qd
	2AwQLyhUfhjghPw6E7Yd/KGtBJ/yQAJ4PN5AG2HlxaW3oLavsaZyzWlV4rH8aduWetn5zFnZixlv9
	jH3vVWuYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jr0XB-00079K-8j; Thu, 02 Jul 2020 14:49:53 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jr0UG-0005LO-SF
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 14:46:54 +0000
Received: by mail-wr1-x444.google.com with SMTP id k6so28803451wrn.3
 for <linux-mediatek@lists.infradead.org>; Thu, 02 Jul 2020 07:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dQs4Q7oGTt/0sNcw0ENBRB2w5tCtiZwCiQW85p5XR3U=;
 b=Dq/N0zwqmdZ1Pky1vybgdJTfU1rvLmD2pQ9c00vr1KrgVzDXKqSrslDmwfYFr/6KCK
 ehJ/rv2Lr/z18jHuh8s+yqWsmnxzC6ux4zNbBCd6V9T0xBnvLugJ8tNemxxFlkFG/ZDt
 gwns4rWqq4K2acfTHJlEXcXKdnnasOk6YrTxhliNI+Zmss3EBmCsTymInZ8JBEy99dy3
 OUeLJUBDz6Ah0vntaRPup5QDqARM7ZgsXL3KoVIqbpYMZtOdoURkAyVlIP2tS7Grl7Lx
 YSp64q8Cy5E+a/vdeUBjmCiAy25XXDU+QUVIPcSdPgfjqjBdqE4tTxX3nybtVufRKnsb
 eBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dQs4Q7oGTt/0sNcw0ENBRB2w5tCtiZwCiQW85p5XR3U=;
 b=jsz82x63n35SiQ7uMUp8/vdeFnQw4ObqNKf50tycZmN7ieW2uzP1+rr5U/bFhfCQuP
 ErNYfe5y6uGNHrPW1mM9I0D2q0qXSNBMdKZiI4qo5o5nBOymOIvWm66MVfeusG/18JLz
 KkCJOamDwibMXB7cqY3TnZImZslhN0hzdwKy3r6VFXxyaeudTNehvEDxAdR77BtcmNDv
 THedLGmyUyhx8/udiWdoLQq12d+AIDgIuw5IR2zwvA4PzFRh6Fp3z2SbqAacwtu2e47f
 QfmDrymueo12nRcp+rE6ftl0IiCrLsP6W62hbGW4hRfOW90DMrsdwKQ8Ba+CaDSUSydZ
 HoHw==
X-Gm-Message-State: AOAM532JguYC1VbVI4f3+32nhg5lY88/aM+dVR6m0DiyMJ7jz3y3R+jG
 4p5Oa7BBt+zvuVl2gwZ+wTkgWg==
X-Google-Smtp-Source: ABdhPJyvjgDLGI4NJ9Sbqgluo1gBEWKCmbDfXNg8SW/WfotLzOFpxXr/k7akiCP8oG+foxClcw6o+Q==
X-Received: by 2002:a5d:42c8:: with SMTP id t8mr30432630wrr.23.1593701211993; 
 Thu, 02 Jul 2020 07:46:51 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 07:46:51 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 16/30] usb: mtu3: mtu3_trace: Function headers are not
 suitable for kerneldoc
Date: Thu,  2 Jul 2020 15:46:11 +0100
Message-Id: <20200702144625.2533530-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702144625.2533530-1-lee.jones@linaro.org>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_104653_041871_B25AD8B8 
X-CRM114-Status: GOOD (  11.25  )
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
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmdzOgoKIGRyaXZlcnMv
dXNiL210dTMvbXR1M190cmFjZS5jOjEzOjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlw
ZSBmb3Ig4oCYbXR1M19kYmdfdHJhY2XigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogMTMgfCB2
b2lkIG10dTNfZGJnX3RyYWNlKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hhciAqZm10LCAu
Li4pCiB8IF5+fn5+fn5+fn5+fn5+CgpDYzogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVk
aWF0ZWsuY29tPgpDYzogbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvdXNi
L210dTMvbXR1M190cmFjZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvbXR1My9tdHUzX3RyYWNl
LmMgYi9kcml2ZXJzL3VzYi9tdHUzL210dTNfdHJhY2UuYwppbmRleCA0ZjVlNzg1N2VjMzEyLi4x
NTVlYWUxMjZlNWUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9tdHUzL210dTNfdHJhY2UuYwor
KysgYi9kcml2ZXJzL3VzYi9tdHUzL210dTNfdHJhY2UuYwpAQCAtMSw1ICsxLDUgQEAKIC8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCi0vKioKKy8qCiAgKiBtdHUzX3RyYWNlLmMg
LSB0cmFjZSBzdXBwb3J0CiAgKgogICogQ29weXJpZ2h0IChDKSAyMDE5IE1lZGlhVGVrIEluYy4K
LS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
