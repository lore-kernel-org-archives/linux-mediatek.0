Return-Path: <SRS0=/klC=A3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AC8C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 23:31:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55BC92076D
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 23:31:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zb+4Aw3K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKAeTQbW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55BC92076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hLcxafOAyderpXBX3Vr+bHbTJtZx4IZqnfNh02ioVIM=; b=Zb+4Aw3KM3lGZW6rsS2OicfR7B
	HwhhK1ONNVmbSXN9ufJiyOe3CJyXeyXEA3yeb7oKSm4qNkPKb98lRN+HeCzkC6AxwRnsUtnQP/0Vp
	Am2lpkG0shz7cIallLD6xmWag3kHbEDHa0tiPF9m02Ga0WJWUR/onyMGk9ut3eGON+Hqg5kF2GuPW
	Ahaa7xlBxYsA2ZW7y/h7vBwNvb/v1Utd9fpTkaJsQploSM6CiWlZlB9xDyK8qTcNzCTu+N/beZ9gl
	EUAvujm9gXGgxlc+ocB50dK9sjY4dgUSHt28Ka1jmy8w+VS9B1nDjnz6ZZAQki0YaipURFFA9M5os
	r77n1SWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwDLJ-0007Bs-35; Thu, 16 Jul 2020 23:31:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwDLG-0007BL-Go
 for linux-mediatek@lists.infradead.org; Thu, 16 Jul 2020 23:31:07 +0000
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A488220870;
 Thu, 16 Jul 2020 23:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594942265;
 bh=Bcdw+IuUUhuWHE6ZYrxnpLxm+0jqUc5X3yImBcVA+mE=;
 h=From:To:Cc:Subject:Date:From;
 b=HKAeTQbWyXGIpJljq5h6bH1SoqCM+b2Iq50BzdB0IFkqtnUgPtpss6D/l6tGGcjCs
 2d3udwQpDFt6/MoEvPyknKGZguHBRnokIK5iC3MjBjY9GqJXV/ZxSqDX334P739Lna
 ix3/y8TFmZZxnHjAN1kqYtfq7gvp9546XX5rCq1A=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [GIT PULL] mediatek drm next for 5.9
Date: Fri, 17 Jul 2020 07:31:02 +0800
Message-Id: <20200716233102.566-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_193106_666925_21F95B44 
X-CRM114-Status: UNSURE (   6.39  )
X-CRM114-Notice: Please train this message.
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIERhdmUgJiBEYW5pZWw6CgpUaGlzIGluY2x1ZGUgY29udmVydGluZyBtdGtfZHNpIHRvIGRy
bV9icmlkZ2UgQVBJLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KClRoZSBmb2xsb3dpbmcgY2hhbmdl
cyBzaW5jZSBjb21taXQgNWFiNTQ2ZjVlNjMwOTM3M2FlZjAxYThkMzk4ZTE2M2FiN2E3ODQzMToK
CsKgIGRybS9tZWRpYXRlazogbXRrX2hkbWk6IFJlbW92ZSBkZWJ1ZyBtZXNzYWdlcyBmb3IgZnVu
Y3Rpb24gY2FsbHMgKDIwMjAtMDctMDUgMDY6Mzk6MjEgKzA4MDApCgphcmUgYXZhaWxhYmxlIGlu
IHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCsKgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQgdGFncy9tZWRpYXRlay1k
cm0tbmV4dC01LjkKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBhOWQ5ZmVhNzRiZTI4
NWEyODg1ZDhmMzM5NTA0MmNjNGRkZTI3ZTZhOgoKwqAgZHJtL21lZGlhdGVrOiBtdGtfZHNpOiBD
cmVhdGUgY29ubmVjdG9yIGZvciBicmlkZ2VzICgyMDIwLTA3LTA1IDA4OjA2OjI4ICswODAwKQoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpNZWRpYXRlayBEUk0gTmV4dCBmb3IgTGludXggNS45CgotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkVucmljIEJh
bGxldGJvIGkgU2VycmEgKDUpOgrCoCDCoCDCoCBkcm0vbWVkaWF0ZWs6IG10a19kc2k6IFJlbmFt
ZSBicmlkZ2UgdG8gbmV4dF9icmlkZ2UKwqAgwqAgwqAgZHJtL21lZGlhdGVrOiBtdGtfZHNpOiBD
b252ZXJ0IHRvIGJyaWRnZSBkcml2ZXIKwqAgwqAgwqAgZHJtL21lZGlhdGVrOiBtdGtfZHNpOiBV
c2Ugc2ltcGxlIGVuY29kZXIKwqAgwqAgwqAgZHJtL21lZGlhdGVrOiBtdGtfZHNpOiBVc2UgdGhl
IGRybV9wYW5lbF9icmlkZ2UgQVBJCsKgIMKgIMKgIGRybS9tZWRpYXRlazogbXRrX2RzaTogQ3Jl
YXRlIGNvbm5lY3RvciBmb3IgYnJpZGdlcwoKwqBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RzaS5jIHwgMjY5ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCsKgMSBmaWxlIGNoYW5nZWQsIDg0IGlu
c2VydGlvbnMoKyksIDE4NSBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
