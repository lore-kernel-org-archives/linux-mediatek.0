Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9CAC54E60
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 04:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W2FMqT6nuHSD2h7NIilMGAkP5wvzLoDLjtFDEyBDLIU=; b=33T+oy5ObIs8JlxR0LE8KvqX5b
	PECmnoA2yrCZB0xKU2gArV34HYo+OQr4ZEjQyLJfb8l8+bWXgmZqd3dHJq8GCuM/Z5tLObTF7tQ/f
	Dz3B9cm3oridyDaTLwCe+kU6+oQkCC0OoGHJFcTkAu+SEtcGL+cMnFsHcMNNb7YXLeEpo/To9D+BU
	eJWCLjGPzoCNxR1IiicTztkCGnA0r9vTp5xjLebjTPmicaBzhiZXH+e/Fc77hA4dcsf68pezl8/34
	Qy9OiyOvDbfSz/XEydwzt5WhzlCvaVYaiGxMP6zofCtY9Cjs2JC728+AnzP/e38avzs6leMHkatAe
	FY6UFzww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlM4H-00000002LRF-3hJR;
	Sat, 16 Mar 2024 04:54:49 +0000
Received: from outgoing4.flk.host-h.net ([188.40.0.90])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlM4C-00000002LOE-2cMJ;
	Sat, 16 Mar 2024 04:54:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=risingedge.co.za; s=xneelo; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:reply-to:sender:bcc:in-reply-to:references
	:content-type; bh=W2FMqT6nuHSD2h7NIilMGAkP5wvzLoDLjtFDEyBDLIU=; b=lucJiYNzMeV
	mrR13FCZqsqEpP9c6Ll5dy7TUAaRcyiAt6j4gpNvQMEP4kl9Wo/ZrpTgCfwraTP0tvndBMSP3KE5v
	cZTeLoOI6a0if9hINURHmBj+cFFES+7CbtQeyTPPQpV00ozFwQkMURUismLDHxVH3dX68UR+oAAod
	4XWiymYiniKZxWU7VerKRYDW0KUI8TjEQFlH+YrV5zF5LcZgY5wUU6p3+lxvu3zK75rHI1g5lxWGL
	owVo6wNTGRGUZAy0i82+EhGa3N4C/Sef9RFZKO4tCHSJMgEYtV9kzYgUH3eEv0Fbofm0TPEElcXsF
	uYw8YcnxOloI+OWRMKFPRaQ==;
Received: from www31.flk1.host-h.net ([188.40.1.173])
	by antispam1-flk1.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1rlM40-00Bxtu-Cz; Sat, 16 Mar 2024 06:54:35 +0200
Received: from [41.144.0.193] (helo=localhost.localdomain)
	by www31.flk1.host-h.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1rlM3x-00048C-F2; Sat, 16 Mar 2024 06:54:30 +0200
From: Justin Swartz <justin.swartz@risingedge.co.za>
To: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Justin Swartz <justin.swartz@risingedge.co.za>
Subject: [PATCH 00/14] mips: dts: ralink: mt7621: improve DTS style
Date: Sat, 16 Mar 2024 06:54:28 +0200
Message-Id: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: justin.swartz@risingedge.co.za
X-Virus-Scanned: Clear
X-Originating-IP: 188.40.1.173
X-SpamExperts-Domain: risingedge.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@risingedge.co.za
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00666020567863)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+qE4ieD3J4rOkW/XG8b4ehPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wCPRB8bAzJcv2cv+UqiTTc2+CpNcmBnO4XM3Sck4bwNogU
 WCl1nkLBzZX0KuJ9bXiS85Z42w/+2OBolTNFbPomXFWCX8oNdggW7HE9XDTdSejrkEpbuUvwMvHx
 3T+KSG//gbuP7hnUK8NQdLwsVWKIFDZRrTGv3rxiw9tFrqFSCFNiLZt/QXQnOBRD+jq1HsKsDh/6
 Srgk2K3gr1VBfJbChkYH6fbrypLNrde+UooQVNLReLErukdelEOHUIpaBbp5GdnsN8+UvimwMinK
 0+Txhz2u9qvrL2PODYgMZQApJXOjDLkqunZ9NcY2bHZn7CfFscMZZf3sCkN20I5vMh4akiObI7Kj
 vK7X04QEin24qbfMFd8eGjnYW8aSH5qj4ujh/13psIvqSqJFa1CcANErDW/w69saM9prk3jNnHtn
 nuEt/J9wDZeQfiNOYsLDFBdwYt2XtlLzy7G7T4kla0JNnAWQx3FS11bhwUa9HCIwKB+TroNcRY33
 oNmH4nRQzHQazgY7lmveanvOdQzf6IMJ3345q/s6ySNrGnXycmhg3Oiqa1xC06zIZV6bCgVnUnqC
 n3oZFShGuGVczvnnMQuyLtBcNrQxKZYuPe8bdCyw79zlPbqLQkZr26Lcxdvj8cqI+CogZdOhX7v3
 ClXzrmMENhJLl6MBfhzHVBR0wHQZxzIUka7Uq615Mik1qzcz308HFwsY4DWIzjhTYXUG8GBZhle6
 F/kpBdN+oWjoATjEFDwcaiz0R34rhTN+GTbl4uS+pZovX9cex7Ac4fawcerGI7TrGXpM/B/M0BZd
 PfIU1BX7pZc1sE3vsz58auH/srM2fgZ9JmgLbj7sqoEiwv7LCxIiAE5ODMnmwjvj2589zjbyZCiM
 WpBpW8YvoIIqmZcWhL/r/eFjMjJnMHeiAPOVK0T+c9pM0FteOLwuqFxkZtxbXpCgbiKBsA+Ddi6m
 awd1jemntr2PrMOTF1fDnHo5A9JQxMw0XtBqT5kbx7zuprmKeJENT1oiQUtfU17WEZPRHu1+r6ov
 Q/IKaojN7gdb+Glhdb8DP7Iz3Z0Qa+VGiF/lfNRtaK1t4SnssY938wKgOC3c9GkW+OmRHU05XGuW
 g+VcQ3bZb7F7k2CvWvw8dRRAAGTtpIcCl6rs3DrWsywtdUZBTi4VJghbgfc6J3C/b5qgpERsDkCX
 BgcGBwKlYailDNhe7w2QIanZ/NegoJ79AXUnIiEEoyCaZXMG8LAkbJoO2tY/Mg5ClXd30oBm8U++
 JlmpaolH3tK93iPfP9+mLIREJ/NOdtI62oaf3zKhlLqjfBbTCeqYxQZEggRfqXLYM3A6BXfvel8O
 EFDbU51Q2S43vcWL3lM20b9wQESc+PquLiZOpxiedGbqX4nzL9MgCv99rrli2UQdOGeuQqV2IVXB
 o/3R5VqqcOmERbjE+D5FzT0EaduWMjGSdmMR5Ch1HY0a4RW7JP9zvdSGB9tIDxuFtg36jUhUk8/b
 P2/Mw1j9lmNQqiIAMR1SEszVdPY4ocfmWv3Fe9Iziczdq+A=
X-Report-Abuse-To: spam@antispamquarantine.host-h.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_215445_262405_7C6F059E 
X-CRM114-Status: UNSURE (   6.01  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This set of patches was created with the intention of cleaning up
arch/mips/boot/dts/ralink/mt7621.dtsi so that it is aligned with
the Devicetree Sources (DTS) Coding Style [1] [2] guide.

[1] Documentation/devicetree/bindings/dts-coding-style.rst

[2] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html 

Justin Swartz (14):
  mips: dts: ralink: mt7621: reorder cpu node attributes
  mips: dts: ralink: mt7621: reorder cpuintc node attributes
  mips: dts: ralink: mt7621: reorder mmc regulator attributes
  mips: dts: ralink: mt7621: reorder sysc node attributes
  mips: dts: ralink: mt7621: reorder gpio node attributes
  mips: dts: ralink: mt7621: reorder i2c node attributes
  mips: dts: ralink: mt7621: reorder spi0 node attributes
  mips: dts: ralink: mt7621: move pinctrl and sort its children
  mips: dts: ralink: mt7621: reorder mmc node attributes
  mips: dts: ralink: mt7621: reorder gic node attributes
  mips: dts: ralink: mt7621: reorder ethernet node attributes and kids
  mips: dts: ralink: mt7621: reorder pcie node attributes and children
  mips: dts: ralink: mt7621: reorder pci?_phy attributes
  mips: dts: ralink: mt7621: reorder the attributes of the root node

 arch/mips/boot/dts/ralink/mt7621.dtsi | 430 ++++++++++++++------------
 1 file changed, 239 insertions(+), 191 deletions(-)

-- 



