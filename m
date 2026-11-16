Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F26B606A33E
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 14:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z1e9PJOg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0sk6mFXH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bnKc3IJSrt3IePIy9TsoCqbRk4dzHod7cZj0q0eSHH8=; b=Z1e9PJOgPVB8vC804f3yDMGm2h
	dI0dLk7X52e8qH3E8U2IkuJHhjUcSmVSBbzs9yEkYd3vUhrZfTMgIIXbn6xV0OwmcpZW6K9cyG1mf
	8dpDhA77vV8Dc3wwCaEpeuhmH0T2fjfjcPnO8SrTT/jTIJNXROYlEiedANLWsg/hrC8DpcYNrdliG
	1EXJFVGmWZZGmIxRoirhvrCkUzCqk6746OpFer1i7E/u/wnoQy8QapiH2fSUHgfVacL6qtoIbXFhz
	h6whTSck3UmA8XG7J56IvJfY+mI+xPfaSd9geuoKyXXMnFRWm8sBlepd5M0xMxBdB/Zo484bmwMzN
	F72tC3vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxeG-00000002ofI-1DwV;
	Mon, 16 Nov 2026 14:25:32 +0000
Received: from omta040.useast.a.cloudfilter.net ([44.202.169.39])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxeD-00000002od3-3IkH
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 14:25:30 +0000
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id SvcpxiP53OOJnSxeCx6Rnh; Mon, 16 Nov 2026 14:25:28 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SxeBxLzBjxqjjSxeBxAqOo; Mon, 16 Nov 2026 14:25:27 +0000
X-Authority-Analysis: v=2.4 cv=bZxrUPPB c=1 sm=1 tr=0 ts=6afb1258
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=gUJwKisUJcuna-pPN7wA:9 a=CjuIK1q_8ugA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bnKc3IJSrt3IePIy9TsoCqbRk4dzHod7cZj0q0eSHH8=; b=0sk6mFXHdazpnAR1pwYEQWKC6I
	X1E8ekQhO0z3VayxRm1NfHDKZPYKtSjVyBbOQ6BXgsKnbsaQijZg9Njwvi72ApNtUv8cSMNdGc4Vd
	QyBkQyIPDzLAZFyuqMD232Y8huOEnhHlwlN1r/1BLq79zhy1fepUalqTHRZt7AQpgRJ/hNNVCJ4/W
	+wjozLlctGicx/oK/1NIvMu3BrlohLbRxPWhx6Kl99HdJQN9Ph/a5KSW52HJ5bvDy+eWL6YxSlBW3
	Pv6/DkmHUpcXaGr7B2cKNOjA017mfcKr12cerSqK+iWNmuAk3le8gG/O8AgxGgOr0CZNuR51nIbhz
	RUC4xEhA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54554 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSxe8-00000003nQw-0sPf;
	Mon, 16 Nov 2026 19:55:24 +0530
Date: Mon, 16 Nov 2026 06:25:23 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Alexander Letuchiy <asalde.le1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-input@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 3/9] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 compatible for MT6895
Message-ID: <20ace44c-2385-4561-9e69-c6c7bd3a3fb6@roeck-us.net>
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
 <20261113-initial-mt6895-v2-3-4ab0aa9fa391@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-initial-mt6895-v2-3-4ab0aa9fa391@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSxe8-00000003nQw-0sPf
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:54554
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 29
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHhBfpiCBsDxmU+WUgRmSzpiGJ0tWU48XKqOKt38iqhB7Mr9ZnGbUBaUwnLDIGKBFbIckQGB38xqunjsfqsdgpmO8xqKtHzyIusjoJCUj8yFIuGZt8A3
 SImiL1tADzkMiExzuv79mEFQ1sSMqRwmxcG9VS3BzF0KOHdthBgQVy4I940TcqDMsG9YJ3TludDYGQHiGz3uNRzvgNcfb2X+J2OVjXbtK7hjE4UtI4/+amLg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_062529_881380_EE4974C2 
X-CRM114-Status: UNSURE (   6.29  )
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

On Fri, Nov 13, 2026 at 10:04:59PM +0300, Alexander Letuchiy wrote:
> Add a compatible string for the watchdog of the MediaTek MT6895
> (Dimensity 8000/8100) SoC. It does not fall back to mediatek,mt6589-wdt,
> which implies the MT6589 TOPRGU reset layout, as the MT6895 one is not
> known yet.
> 
> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

