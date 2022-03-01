Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA638C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 09:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jPm3Qb1FMzYR14mUzjYLv1krfL1z3TcpdGXB2bWT3kY=; b=q3WjP3j3BHLOvUPHPBV60iCeLJ
	E5+JwNrto7XD7CYEYGAnlIH4ZRMZUc8s/VXVuCKsv+GBXDRnU7XCVrSUJI0H4uHTdBUSOlrH2JTF1
	07CnI/uXis0qjmWN/83d2etL5gdS1ZTbe1bLu0IQ8X0haYyY75DdOjeElSYivSJQlg29ftvar+bds
	yMjA7x8qZZO7/Jm+v50UlgooYU4eqyLo8HpubL1fSzqFV8TzUQnzREY3RKORhCWsK0QBjuzE5jokB
	4HCcL2kZe/n3qP2tX2Txo0SoVghSAcrtB9Pl0PHDi7EKq7oQtX2hglRc9YKSCfqG4R+D+bgs5W9k5
	1z7PjtMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOyy1-00FsEd-Tw; Tue, 01 Mar 2022 09:38:49 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOyxp-00FsCp-Bx; Tue, 01 Mar 2022 09:38:38 +0000
Received: by mail-wr1-x436.google.com with SMTP id bk29so2177657wrb.4;
 Tue, 01 Mar 2022 01:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=AGqj3zqARUTZ9ZQDgZs+PFSA6lptX1zD63YRGqiRdK0=;
 b=YJx9pSRECJeyQYK0gK55pl0wp7u2Eg2umDYPQ3h9jtA6X7HwS7nEbrB2GDXEr20kwY
 n7l05236ttx1dewcupvyh3s0ixqLzBX8NAAO3rfGFTBws95Cq9SzLNXtNmkiw4KDc0R9
 jbO3LMlBJOzgFS5ogZ2RoVgX5fbGsS+b/cB182BHCFrSZf4V23GaPBu3V0m0gKbB/Cxy
 7r+sTPJgLpO1EMNM9YlXbmdstxeSPmO3PJ/iC/FU8obJlRAfzYUCVnef0Gh8yL64jIpM
 3RsbkLnAxqpct5Zb+JpWOR7rEcqD53Ksgzyk1ddhY7C3Gs10Tj/vOS4xRp7BAtKK017g
 M9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=AGqj3zqARUTZ9ZQDgZs+PFSA6lptX1zD63YRGqiRdK0=;
 b=IO58D3q8C6xAUZJ3sNhSO8tBE1KSt5q34SA06hvPJVGZgd7rZpJ5mVGCfqNNzMirca
 a11J2mM0et9h63FxI6HIme33gUcr16tZvOi6Pf46sKRqsRyRzZzJybCcEe7xEOP09zGy
 b+uEuT4b2a2TemyJYisHxLdrzw7zq85JRszZGgFj10NpAaZPQLOkrmkkltMxBjkdUliW
 e0/T19rnhi2RRiARZggior47AAwCW3+mjJt+TjWinbXUcgkn71FKwIzqzNFz7C/9jUjV
 5Yw9U5i0M5DVa16xEds8myiCoLJrw0b3XTK/bPlgntJczIOHXjoGtOAbby27KBA0FpoM
 eqyQ==
X-Gm-Message-State: AOAM533rVVUtSlxNtxtR5OSBGwvSO+uiEqyYLFTVCptrsRGDoBJjeqqs
 eaDquKNiKOOJ+TEBbFt1yys=
X-Google-Smtp-Source: ABdhPJz2waHTw2Hy4YaCi5TEU/BCv9YAfaUv76iZGQbHTxkNRo0QbwunbCVfOdPJ/X+TUIcnNjHxBg==
X-Received: by 2002:a05:6000:1364:b0:1ed:b65a:da45 with SMTP id
 q4-20020a056000136400b001edb65ada45mr19081629wrz.680.1646127515509; 
 Tue, 01 Mar 2022 01:38:35 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 i6-20020adfaac6000000b001e7f9a9498asm13510452wrc.50.2022.03.01.01.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 01:38:35 -0800 (PST)
Message-ID: <8eb8510d-c597-4fee-e4b3-924b6d4bb3be@gmail.com>
Date: Tue, 1 Mar 2022 10:38:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: MediaTek fixes for v5.17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_013837_428035_EA9AF7DA 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQXJuZCBhbmQgT2xvZiwKClBsZWFzZSBoYXZlIGEgbG9vayBvbiB0aGUgZm9sbG93aW5nIGZp
eGVzIGZvciB2NS4xNy4KCkJlc3QgcmVnYXJkcywKTWF0dGhpYXMKCi0tLQpUaGUgZm9sbG93aW5n
IGNoYW5nZXMgc2luY2UgY29tbWl0IDVjMWVlNTY5NjYwZDRhMjA1ZGNlZDljYjRkMDMwNmI5MDdm
Yjc1OTk6CgogICBNZXJnZSBicmFuY2ggJ2Zvci01LjE3LWZpeGVzJyBvZiAKZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RqL2Nncm91cCAoMjAyMi0wMi0yMiAx
NjoxNDozNSAtMDgwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoK
ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbWF0dGhp
YXMuYmdnL2xpbnV4LmdpdC8gCnRhZ3MvdjUuMTctZml4ZXMtdGFnCgpmb3IgeW91IHRvIGZldGNo
IGNoYW5nZXMgdXAgdG8gYzQzMmNkNTk4YTE4NWFmZWZiYTFhYzNiMGVlMjI2ZjIyMmY3MTM0MToK
CiAgIHNvYzogbWVkaWF0ZWs6IG10ODE5Mi1tbXN5czogRml4IGRpdGhlciB0byBkc2kwIHBhdGgn
cyBpbnB1dCBzZWwgKDIwMjItMDMtMDEgCjA4OjM2OjU5ICswMTAwKQoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQotIFNldCBk
aXNwbGF5IHBpcGVsaW5lIHRvIERTSSBvbiBtdDgxODMga3VrdWkgamFjdXp6aQotIEZpeCBkaXNw
bGF5IGZvciBtdDgxOTIgYmFzZWQgYm9hcmRzIGJ5IGZpeGluZyB0aGUgcm91dGluZyB0YWJsZQoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyAoMSk6CiAgICAgICBzb2M6IG1lZGlh
dGVrOiBtdDgxOTItbW1zeXM6IEZpeCBkaXRoZXIgdG8gZHNpMCBwYXRoJ3MgaW5wdXQgc2VsCgpO
w61jb2xhcyBGLiBSLiBBLiBQcmFkbyAoMSk6CiAgICAgICBhcm02NDogZHRzOiBtdDgxODM6IGph
Y3V6emk6IEZpeCBidXMgcHJvcGVydGllcyBpbiBhbngncyBEU0kgZW5kcG9pbnQKCiAgYXJjaC9h
cm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMta3VrdWktamFjdXp6aS5kdHNpIHwgMiArKwog
IGRyaXZlcnMvc29jL21lZGlhdGVrL210ODE5Mi1tbXN5cy5oICAgICAgICAgICAgICAgICAgICB8
IDMgKystCiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
