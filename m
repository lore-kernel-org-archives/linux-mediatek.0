Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4172FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 13:33:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CFDD60F46
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 13:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0CFDD60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zQ/acxnET+NSnhmlB950asTRvzUCrjJsWvEKCLp7g1Y=; b=S3Y9zZ8L4IYNdy
	Teajp50bbVFofN4vN+IYoTMVZuyJAwlZMOz+FOrUEyi1eI521mLBOKfxkgywcI9FGLWkx9o3eG2HH
	cOD+d+QqiXLqqJdGeYPOWjc5quMm+wOOX7YOxKUNjmj03b+0R+wm/hypbNUJphEXLf8qDFBghBdgn
	knqY+U6rfnW9QLG2YpSFlqHxjZXiz4Ie2V1PafLfELwErw0T5R2T/zW2yfKZnG67Mm9ddJFrU8fUW
	EUes/WJ3ggXnQMlrMjlv8MoNOHRsXk2XdDTeCCpg9tVRm+3/3gLWX0VkY4I0s9QrzIlxtd+Ms1fZq
	6dS8B/74hXdCbAygcFpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYq09-002uFl-OJ; Fri, 08 Oct 2021 13:33:29 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYq06-002uEJ-V2
 for linux-mediatek@lists.infradead.org; Fri, 08 Oct 2021 13:33:28 +0000
Received: by mail-oi1-x229.google.com with SMTP id n63so13750706oif.7
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Oct 2021 06:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WoGewCiLqk1L6y+Pgt2DJrjP+8ghH7hEUaGntIWrC6s=;
 b=pBBPhlBaaQ/+9BTkC8YQaIzxZUjhoP5gpNMQgN77vY9v2h7jlzVCbinDSYFVpy6ndp
 Ws/ti+bseFbbE03/vlU7RLpGr+ZmLeFD+9aZUzyKl5KiA1kwk0kGXLgzHtr8zBWYn8xi
 q4ybMOkh/x97fGCnjftfaUtNefTClMrA9CrF8PLx03L/5AatozRBMZJfDQaaGckjkYph
 j0hLuo22LwIe+w52ooreptbTrMgPdlu/1FLlleiZxaowcIgR9Y3QK1tVQF4VFXn2kiwC
 /CEI1mjKgHU0X1rWDCt2RP121DdUPklm+JYOoNFXNvxwK1LKfV6mI6GyhI2lERLEg2ND
 DhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WoGewCiLqk1L6y+Pgt2DJrjP+8ghH7hEUaGntIWrC6s=;
 b=CiR87kSGb4cLcvBHxi4Q4iNdBxV5X5wR5It0nEc/o8VVpvhwvVM5/0jBTkTl/mAkBe
 dqHz8ZmoQUdGK8aQXuTlQb5YkRnMo8BPyN/Hq/zCTMJ0kKeI4ag6VZRUgMcCUkvfJ8St
 1SHNXxp7rvv+fLMkpX1bnwSvVjsbZB9MKMWmuNVGxQ3DE692xhogVBC1K9jYuopsioda
 EUPspE2rRZf/djLnrvIdKu59PWN1SqnPmnt7xUjHsmfVGwAmWYB52BpJK7+yMnlBE25F
 s/+h6C3ohkj4fR6p/Js7P30Ni/b+u112dugTYdA2BJNFZFuhsRXMlv3JTh3eJgROQHGS
 eYpw==
X-Gm-Message-State: AOAM531ZIuXE8gyPXv6HnnGTnx8fZjjd3yMta2EN4a5UWza0HELmj/qe
 leD/3RdMtDXZ4Xll9aXAmjpdUAeMYcRF0vuGQTQ=
X-Google-Smtp-Source: ABdhPJzqOPRwfbVyLwZGp7MkC4sShrKrhfIK/YsbRKO8AG2yd7R+50aZOrvJPgTLoJY6/jZl+GNohd1/SRi0OGXehm4=
X-Received: by 2002:a05:6808:15:: with SMTP id
 u21mr16376940oic.129.1633700005586; 
 Fri, 08 Oct 2021 06:33:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211007235310.14626-1-chunkuang.hu@kernel.org>
In-Reply-To: <20211007235310.14626-1-chunkuang.hu@kernel.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 8 Oct 2021 15:33:14 +0200
Message-ID: <CAFqH_51hO2efxbQkkbzNHSk92zOZGeFJBu4Ocijk_cpxFDJ2fw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Revert series "CMDQ refinement of Mediatek DRM driver"
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_063327_037565_01ED4A57 
X-CRM114-Status: GOOD (  11.02  )
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

SGkgQ2h1bi1LdWFuZywKClRoYW5rIHlvdSB0byB0YWtlIHRpbWUgdG8gc2VuZCB0aGlzLCBmb3Ig
ZnVsbCBzZXJpZXMKClRlc3RlZC1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFs
bGV0Ym9AY29sbGFib3JhLmNvbT4KCkRpc3BsYXkgaXMgbm93IHdvcmtpbmcgYWdhaW4uCgpUaGFu
a3MsCiAgRW5yaWMKCgpNaXNzYXRnZSBkZSBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2Vy
bmVsLm9yZz4gZGVsIGRpYSBkdi4sIDgKZOKAmW9jdC4gMjAyMSBhIGxlcyAxOjUzOgo+Cj4gQ29t
bWl0IGMxZWM1NGI3YjVhZgo+ICgiZHJtL21lZGlhdGVrOiBVc2UgbWFpbGJveCByeF9jYWxsYmFj
ayBpbnN0ZWFkIG9mIGNtZHFfdGFza19jYiIpCj4gd291bGQgY2F1c2UgbnVtZXJvdXMgbXRrIGNt
ZHEgbWFpbGJveCBkcml2ZXIgd2FybmluZzoKPgo+IFdBUk5JTkc6IENQVTogMCBQSUQ6IDAgYXQg
ZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYzoxOTgKPiBjbWRxX3Rhc2tfZXhlY19k
b25lKzB4YjgvMHhlMAo+Cj4gU28gcmV2ZXJ0IHRoYXQgcGF0Y2ggYW5kIGFsbCB0aGUgcGF0Y2hl
cyBkZXBlbmQgb24gdGhhdCBwYXRjaC4KPgo+IENodW4tS3VhbmcgSHUgKDUpOgo+ICAgUmV2ZXJ0
ICJkcm0vbWVkaWF0ZWs6IENsZWFyIHBlbmRpbmcgZmxhZyB3aGVuIGNtZHEgcGFja2V0IGlzIGRv
bmUiCj4gICBSZXZlcnQgImRybS9tZWRpYXRlazogQWRkIGNtZHFfaGFuZGxlIGluIG10a19jcnRj
Igo+ICAgUmV2ZXJ0ICJkcm0vbWVkaWF0ZWs6IERldGVjdCBDTURRIGV4ZWN1dGlvbiB0aW1lb3V0
Igo+ICAgUmV2ZXJ0ICJkcm0vbWVkaWF0ZWs6IFJlbW92ZSBzdHJ1Y3QgY21kcV9jbGllbnQiCj4g
ICBSZXZlcnQgImRybS9tZWRpYXRlazogVXNlIG1haWxib3ggcnhfY2FsbGJhY2sgaW5zdGVhZCBv
ZiBjbWRxX3Rhc2tfY2IiCj4KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0
Yy5jIHwgMTU3ICsrKystLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjQg
aW5zZXJ0aW9ucygrKSwgMTMzIGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjI1LjEKPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
