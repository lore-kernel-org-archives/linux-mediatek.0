Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CF9C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 15:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s3Bkp+sk5cEH8dhT4WNN3ZclE+enakRu3U0md99m91A=; b=XmVya62OznYrjsIfv46Fuwx14s
	eRi4wGCw8f/SbAYGx8HbXUW5ZJh7xnN5m0wP7us/xLFTt7C9MoM4Id72KluLRhQowX5B7bbX+q2UB
	cwZuZMOucqDrGIwD5xr63+rafkRq6mQVMwvAPh4oA75D1Iw8kWM6Q9Ix1xT7avptytER6tcUmB9Mi
	5qENZYloE7dJ4Zca2mx2doEPvjZY+ZHXXBIW29e31v4JvqwitBhp5PeA+OmKtCtKgQafbNWnpSSep
	FgiazisEY86tYPneJKVZy72bRSqUH7kCW+Q9ySjE1WVUQEcP8V0tjVEs3zLG+iFewyUnfMYI6ZoWs
	v+Q+GWbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ricbF-0000000A1D3-2Q9a;
	Fri, 08 Mar 2024 15:57:33 +0000
Received: from outgoing1.flk.host-h.net ([188.40.0.86])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ricb9-0000000A1AH-1j3b;
	Fri, 08 Mar 2024 15:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=risingedge.co.za; s=xneelo; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:reply-to:sender:bcc:
	in-reply-to:references; bh=s3Bkp+sk5cEH8dhT4WNN3ZclE+enakRu3U0md99m91A=; b=Tj
	zfEe0KCfnKZ31cVvI1bnoAfhck1cLJNN5j4WGM0LlbnLs4CGsoyJMubg+pSCIUSICAI4elmfR6INx
	oqdEClbJrVwVyqfmAZttKpwYA+LeIXYvh0Xgj8b+MaL0Y/4dOQmc+lfMJCVNg+CbZWOoh+Lj/B6LM
	pU6PzplQVdocREWK7W4UZCRz+mmXIlTJ1Fqv9pVLa7O2HpMZb8fIgIk8LJ61Zr00vvF3KogI6zz6Q
	EPkkHDuOKZIMlgfN+FFbQ+Cr9P0vBOWxVrnazM83PyF4KptJgDclwij1VlmfE/OgT4Rzg3aWs0Kaz
	x2AZSPKOoRjmrp2Tz9aQNY48pG6xXxXg==;
Received: from www31.flk1.host-h.net ([188.40.1.173])
	by antispam3-flk1.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1ricb1-00667H-AO; Fri, 08 Mar 2024 17:57:21 +0200
Received: from [41.144.0.96] (helo=localhost.localdomain)
	by www31.flk1.host-h.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1ricax-0007Wk-Lp; Fri, 08 Mar 2024 17:57:16 +0200
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
Subject: [PATCH v3 0/3] Extend devicetree coverage of MT7621's UART interfaces
Date: Fri,  8 Mar 2024 17:56:13 +0200
Message-Id: <20240308155616.11742-1-justin.swartz@risingedge.co.za>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: justin.swartz@risingedge.co.za
X-Virus-Scanned: Clear
X-Originating-IP: 188.40.1.173
X-SpamExperts-Domain: risingedge.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@risingedge.co.za
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.09)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT8fZxC4vjxyeGw0YdjGdfE4PUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wCPRB8bAzJcv2cv+UqiTTc2+CpNcmBnO4XM3Sck4bwNogU
 WCl1nkLBzZX0KuJ9bXiS85Z42w/+2OBolTNFbPomXFWCX8oNdggW7HE9XDTdSejrkEpbuUvwMvHx
 3T+KSG//gbuP7hnUK8NQdLwsVWKIFDZRrTGv3rxiw9tFrqFSCFNiLZt/QXQnOBRD+jq1HsKsDh/6
 Srgk2K3gr1VBfJbChkYH6fbrypLNrde+UooQVNLReLErukdelEOHUIpaBbp5GdnsN8+UvimwMinK
 0+Txhz2u9qvrL2PODYgMZQApJXOjDLkqunZ9NcY2bHZn7CfFscMZZf3sCkN20I5vMh4akiObI7Kj
 vK7X04QEin24qbfMFd8eGjnYW8aSH5qj4ujh/13psIvqSqJFa1CcANErDW/w69saM9prk3jNnHtn
 nuEt/J9wDZeQfiNOYsLDFBdwYt2XtlLzy7G7T4kla0JNnAWQx3FS11bhwUa9HCIwKB+TroNcRY33
 oNmH4nRQzHQazgY7lmveanvOdQzf6IMJ3345q/s6ySNrGnXycmhg3HXEg/EVeP6q1VIM6UZD+kIM
 LbHRR8LeQMsdlnjm8uSfLtBcNrQxKZYuPe8bdCyw79zlPbqLQkZr26Lcxdvj8cqI+CogZdOhX7v3
 ClXzrmMENhJLl6MBfhzHVBR0wHQZxzIUka7Uq615Mik1qzcz30+tdk6yIuh9K7v+Nq0Cm3JVhle6
 F/kpBdN+oWjoATjEFDwcaiz0R34rhTN+GTbl4uS+pZovX9cex7Ac4fawcerGI7TrGXpM/B/M0BZd
 PfIU1BX7pZc1sE3vsz58auH/srM2fgZ9JmgLbj7sqoEiwv7LCxIiAE5ODMnmwjvj2589zjbyZCiM
 WpBpW8YvoIIqmZcWhL/r/eFjMjJnMHeiAPOVAT1rE1/vP68Bb4z3v3h3gCdXrv2+9GnNX30LKqXb
 fwFKgm/rnYBl+Mj5KqOl6Jzub/f3QhLRbOgisvi5VU9eNBtgo6zjiatjNO/pnMCjuIvXs/AyV/Ns
 URB/R+FlEHyAzksgfaRvdgw0WK34QWnzHHMcN6qoXPjenLhIOF1oeRYbjF1Hp647mOWoQlc3hL3c
 dBMSQgQtiTUcJp5roVy0acgXJIAueV/FFotRFu8Zctt4u/m4iBmYb1/LCV4/EuVHup06w3Vwxf9C
 F7D6LKKRTfdjzQ6YC7Heg3Xf7O1TOd6RcY/MXB8eEq3bCN2QohZvyS03iBmgsz450Kmjd3fGVw89
 m4JEtwM4ySEyce2TarLXkUAX3Q0NSs+JLyVHSkEOIbtf63VNbf0lrvssY+k7AHGi1NevGWTo2+h8
 Lhk4HCeZR7ymlGVRtthBJ2y8A5arx6JItKpFaUNPGMMlvbMX0nyK1NiAJ0y2Qvvn6ds6mor35w4f
 SfHzQbABJfgy21HclcZkPRq7NhoxyMwqi8Q23Rgadfh5T5n5D4OHHpbEIgsllZKWnzc5M5WlNtVJ
 qo05MS+4ayUpOtEhdxekWDmK9g==
X-Report-Abuse-To: spam@antispamquarantine.host-h.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_075728_104169_A429D0CE 
X-CRM114-Status: UNSURE (   6.31  )
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

This patchset associates the uart1_pins group with serial0 and adds
two nodes, serial1 and serial2, that define the interface to the
MT7621's UART2 and UART3 respectively. 

Changes in v3:
  Added spacing between properties as requested by Arınç ÜNAL.

Changes in v2:
  Reordered properties as requested by Sergio Paracuellos.

Justin Swartz (3):
  mips: dts: ralink: mt7621: associate uart1_pins with serial0
  mips: dts: ralink: mt7621: reorder serial0 properties
  mips: dts: ralink: mt7621: add serial1 and serial2 nodes

 arch/mips/boot/dts/ralink/mt7621.dtsi | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

-- 


