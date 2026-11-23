Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD22606A326
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 20:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N8BmFz+d;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0JY4wPg4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Znz/EHw8pGjnVb+24THLSzwjj9xCRhxrR3p+gGFhSv0=; b=N8BmFz+dq4KJ7HR/MTfVPM0AaY
	nKb6pBzGruN5F2UllPmoQ8V2YXcNysQEUqDWbDEz8PwRys/maGdDPJdT+PMpnl9+Fv5d+SOB8cwoC
	TrqgRsioNNqGu6zltBTp5INNPvwaDW9HtmoqfTiz3NmQE3kmoL2fpw1jMDXreMKmXsPBCTB8Tk6iT
	4Kkr3xt2mXGAwneQtpZN0AfIp8Swl/BOeHHR/LFHRC6yVKOcI4EbnUZhY6FByuOfWwVjDmQ32HeRa
	79Z4Qn9urbPNeSU19+K7pYrODBoASjKVR0/Lk7FR7y/ME+XgO09AsgZwNnSPn2CfZ+Eg5nsA39ajp
	q8jubttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaRK-00000004ndh-0M4e;
	Mon, 23 Nov 2026 20:15:02 +0000
Received: from omta40.uswest2.a.cloudfilter.net ([35.89.44.39])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaRH-00000004ncR-28Nj
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 20:15:00 +0000
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id VRmFxJwwAyb4YVaR5xtnCF; Mon, 23 Nov 2026 20:14:47 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id VaR4xGvNhSgq1VaR4xAnx3; Mon, 23 Nov 2026 20:14:46 +0000
X-Authority-Analysis: v=2.4 cv=c8KrQQ9l c=1 sm=1 tr=0 ts=6b049eb6
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=vsWaLUaKAAAA:8
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=eMddLIfAi8SY0Rflj0oA:9 a=CjuIK1q_8ugA:10
 a=ZAjiiiQUslnskKx8wA3N:22 a=AbAUZ8qAyYyZVLSsDulk:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Znz/EHw8pGjnVb+24THLSzwjj9xCRhxrR3p+gGFhSv0=; b=0JY4wPg4lQatPuT+RzaNpzWaxh
	4vjqPfVlAaAotDLwhzu5P68Y9CDpqgF9Ix1HiqTZKvhWGvmUP2SbWYbhWvqDAUnSOgkaWhOp7zaY4
	4gzT7xmT2GOcFFKtLX8OqI5xweA3YOHvi3jbRP7A2NT7F5J++9/kF7Z76Us3vAdFniZLal16URCBU
	4VHSiJRnA3z22qhFVHivGS+bAYr0R19LTcDMbPYyzHdtFpDUbdOUhA+8XUF6378z3LELcz3ggdxmC
	GdmRZz1JTHNRfCscBtdRXTj13ViWMAT23c3kknIGZ+nz0jjksoLfYcL7Pb5tvmO/DrxmNHK09SeqF
	G/HoNtlg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:60706 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xVaR3-00000001eYv-0aUE;
	Tue, 24 Nov 2026 01:44:45 +0530
Date: Mon, 23 Nov 2026 12:14:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rui Cao <i@udp0.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org,
	linux-serial@vger.kernel.org, phone-devel@vger.kernel.org,
	Roman Vivchar <rva333@protonmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 MT6833
Message-ID: <352ec537-ea94-41ef-bba2-44964fb8ebd2@roeck-us.net>
References: <20261117-mt6833-base-v2-0-058a0685c40c@udp0.com>
 <20261117-mt6833-base-v2-2-058a0685c40c@udp0.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-mt6833-base-v2-2-058a0685c40c@udp0.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xVaR3-00000001eYv-0aUE
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:60706
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 34
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfP2Zlw98tZwLEQHPBCDD2DCd783ET09Rru7BBtCipuJJzUmVL6fXjmwseM2lIHY9zVjkgD8otKQzAjYgB359Tu/ZrPTI92ygaLZacEILfqSd/qnXujs6
 3pF6Q7YHNjY/ICNFBqrC69W0mY4QoH6W7eIFOTpTq9c00l3GEus3Mm9BzLCirizNmXZCXXTh+g+LF85ASLa7xGd5dqaw+B+nhyGBwlW950bV4MEsbAQYIThC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_121459_562699_D86C57AE 
X-CRM114-Status: UNSURE (   5.68  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.1 (/)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 05:11:32PM +0800, Rui Cao wrote:
> From: Rui Cao <i@udp0.com>
> 
> Add MediaTek's MT6833 (Dimensity 700) as a compatible of its own.
> 
> It can't fall back to mediatek,mt6589-wdt, which also describes
> MT6589's twelve TOPRGU reset lines: MediaTek's kernel for MT6833 resets
> the connectivity CPU through bit 12 of WDT_SWSYSRST, past them, and has
> no full reset table for the SoC to take one from.
> 
> Signed-off-by: Rui Cao <i@udp0.com>
> Reviewed-by: AngeloGioacchino Del Regtno <angelogioacchino.delregno@collabora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

