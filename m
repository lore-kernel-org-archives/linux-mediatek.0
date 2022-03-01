Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DD7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 20:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9S4r9Pimsip5bMQ83XPtNz7FKJhxVzOjFikhNFKQ6Es=; b=kk1QWEyTehk5g0
	/l9YDQTW+5B9hMTMYMYy++K1AGVFB94fczpGpZseYCnOfxs51fg3QgJQ7UhgNB0NeBGCQ4G2fkYae
	/Ogb01HsOW7NwNohxnqCHfBNa27gy6X57XWtMoUwecVf8D9rUXcepJoktb5Bc/iz1PQ0dFnQdARrb
	lpd4ACER/nqAQZiUL06GfyeQccvME1xW7NCtdr3L9udsSYzrRjRt3MNOxq787GM4DkexXsnE7Cdj3
	ALfRf0Eu6FTFeAX4XIUOOL5p5LVQEMmVgyb41uiokYrgpDGvacbk4w2gZzVnMHWpb+v15nroh1CI/
	nxfrGp4udsa7LCjw/bMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP9AO-000TSB-4O; Tue, 01 Mar 2022 20:32:16 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP9AA-000TO3-Va; Tue, 01 Mar 2022 20:32:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 76E0A1F44A0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646166719;
 bh=30KWDp2GNK/sf6NE9GWC366W39fquqf0+OV7OW587yY=;
 h=From:To:Cc:Subject:Date:From;
 b=PfybGxvTAmNXQegyu9H4FbwjrKojrvsOFSQyPxT8iuDkBIg92ncD1k2RPh5oEoR3l
 amaskfUhltQKdLtaXsUb1STAu+WVJn7tWQCcHcK7gMJodK6c77UFizhdXpd50VY7GI
 HSD68GE7UFE/coOMRB5SHwdFaRLuqN4POmckGbTM8TgoNlZW+6pSXMdrd3TEJhjUUr
 KiBXQvjXpM/sVLN9kVtceOH69UiO0y+PrqgXp0tBkM2eVByvHXpqmnvmigs0cy4KrQ
 //N5oNH3yehsZJK8mpqP/+VvQwefp6sQmDyma16WKI/Vk+qqh4HVPw3weQxCPQu3uU
 XcY6M+aybPSNQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] arm: dts: mediatek: Format mediatek,
 larbs as an array of phandles
Date: Tue,  1 Mar 2022 15:31:46 -0500
Message-Id: <20220301203147.1143782-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_123203_235219_84CCEA2B 
X-CRM114-Status: GOOD (  13.04  )
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

Q29tbWl0IDM5YmQyYjZhMzc4MyAoImR0LWJpbmRpbmdzOiBJbXByb3ZlIHBoYW5kbGUtYXJyYXkg
c2NoZW1hcyIpCnVwZGF0ZWQgdGhlIG1lZGlhdGVrLGxhcmJzIHByb3BlcnR5IGluIHRoZSBtZWRp
YXRlayxpb21tdS55YW1sCmR0LWJpbmRpbmcgdG8gbWFrZSBpdCBjbGVhcmVyIHRoYXQgdGhlIHBo
YW5kbGVzIHBhc3NlZCB0byB0aGUgcHJvcGVydHkKYXJlIGluZGVwZW5kZW50LCByYXRoZXIgdGhh
biBzdWJzZXF1ZW50IGFyZ3VtZW50cyB0byB0aGUgZmlyc3QgcGhhbmRsZS4KClVwZGF0ZSB0aGUg
bWVkaWF0ZWssbGFyYnMgcHJvcGVydHkgaW4gdGhlIGFybSBEZXZpY2V0cmVlcyB0byB1c2UgdGhl
CnNhbWUgZm9ybWF0dGluZy4gVGhpcyBjaGFuZ2UgZG9lc24ndCBpbXBhY3QgYW55IGJlaGF2aW9y
OiB0aGUgY29tcGlsZWQKZHRiIGlzIGV4YWN0bHkgdGhlIHNhbWUuIEl0IGRvZXMgaG93ZXZlciBm
aXggdGhlIHdhcm5pbmdzIGdlbmVyYXRlZCBieQpkdGJzX2NoZWNrLgoKU2lnbmVkLW9mZi1ieTog
TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgoKLS0tCnYx
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYXRlay8yMDIyMDIyNTIyNTMxNS44
MDIyMC0xLW5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tLwoKQ2hhbmdlcyBpbiB2MjoKLSBTcGxpdCBh
cm0gYW5kIGFybTY0IGNoYW5nZXMgaW50byBzZXBhcmF0ZSBjb21taXRzCgogYXJjaC9hcm0vYm9v
dC9kdHMvbXQyNzAxLmR0c2kgIHwgMiArLQogYXJjaC9hcm0vYm9vdC9kdHMvbXQ3NjIzbi5kdHNp
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvbXQyNzAxLmR0c2kgYi9hcmNoL2FybS9i
b290L2R0cy9tdDI3MDEuZHRzaQppbmRleCA0Nzc2Zjg1ZDZkNWIuLjY0NzIyMjg1MjI4YyAxMDA2
NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvbXQyNzAxLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9v
dC9kdHMvbXQyNzAxLmR0c2kKQEAgLTIyMiw3ICsyMjIsNyBAQCBpb21tdTogbW1zeXNfaW9tbXVA
MTAyMDUwMDAgewogCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTA2IElSUV9UWVBFX0xFVkVMX0xP
Vz47CiAJCWNsb2NrcyA9IDwmaW5mcmFjZmcgQ0xLX0lORlJBX000VT47CiAJCWNsb2NrLW5hbWVz
ID0gImJjbGsiOwotCQltZWRpYXRlayxsYXJicyA9IDwmbGFyYjAgJmxhcmIxICZsYXJiMj47CisJ
CW1lZGlhdGVrLGxhcmJzID0gPCZsYXJiMD4sIDwmbGFyYjE+LCA8JmxhcmIyPjsKIAkJI2lvbW11
LWNlbGxzID0gPDE+OwogCX07CiAKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL210NzYy
M24uZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL210NzYyM24uZHRzaQppbmRleCBiY2IwODQ2ZTI5
ZmQuLmY5ZTAzMTYyMWM4MCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvbXQ3NjIzbi5k
dHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL210NzYyM24uZHRzaQpAQCAtMTA3LDcgKzEwNyw3
IEBAIGlvbW11OiBtbXN5c19pb21tdUAxMDIwNTAwMCB7CiAJCWludGVycnVwdHMgPSA8R0lDX1NQ
SSAxMDYgSVJRX1RZUEVfTEVWRUxfTE9XPjsKIAkJY2xvY2tzID0gPCZpbmZyYWNmZyBDTEtfSU5G
UkFfTTRVPjsKIAkJY2xvY2stbmFtZXMgPSAiYmNsayI7Ci0JCW1lZGlhdGVrLGxhcmJzID0gPCZs
YXJiMCAmbGFyYjEgJmxhcmIyPjsKKwkJbWVkaWF0ZWssbGFyYnMgPSA8JmxhcmIwPiwgPCZsYXJi
MT4sIDwmbGFyYjI+OwogCQkjaW9tbXUtY2VsbHMgPSA8MT47CiAJfTsKIAotLSAKMi4zNS4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
