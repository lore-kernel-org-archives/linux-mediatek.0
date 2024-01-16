Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C05FC47077
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 17:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hOfx88Mr5TBRirZPgigQeV/BpPCftA+KViWmZUfBk0=; b=F8J1Vef16DEevzofRAVv3Mk9HU
	HCbbJ8K+A/oNVlm9WqT4YSXhKzY9bTx50YcBNX/buDS7U5mJinT3BidTDJkqN22cMpvYEGMeiMLTH
	Xg3ke6HVd1U10S5is7c1tJnJdclPvFZxpzURBdSbz94fdJBg6/RRQI2SDzTO5ugPH+b/HiiMbCvRZ
	YsT5coaJGqFQOM9JITWZvYmTbuahMZVBbZB+I+Hgdb0BT44RkRXp7IFkFIV3JOsIpdgc1n1z9JG4t
	J25PbmZf+b9+JgYcMaNoFMvywGNPpU1RwQF8EYmL5YG0o1MvN9Q447DG5OY3Qi3q32etm6CNFkKsh
	CpKFxMhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPnFL-00CnRA-35;
	Tue, 16 Jan 2024 17:29:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPnFI-00CnQ3-1j;
	Tue, 16 Jan 2024 17:29:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 59D67B80E77;
	Tue, 16 Jan 2024 17:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474D2C433C7;
	Tue, 16 Jan 2024 17:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705426138;
	bh=/hOfx88Mr5TBRirZPgigQeV/BpPCftA+KViWmZUfBk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pn891NJyEc/4JfRFf6f3uY/VbDV663ecz9GSyg/vZfSO867aW+DuBOa44ggqyJ0xC
	 h9n4VWWmglvVgzobfA9ebqt4iN8YPHAaxz+RCicPlr5wWxuEcfoBzn68zTWD6TTc2O
	 4zIstqYGjpWrPNPuRDJRjyvpZSSPzYF7OUEMdZmVylPX8tH9Z/J52lMGfXP7Mj1RRn
	 AOW3S0hZXhAY9RFkRvzpEKn5P9lSnVO3sJDozR49t9w89Zh8XdPZMlkPwLadnQh2vA
	 p9fM8YwjGWVnv12uBradnGp39p/NsD9mpdrw+/bkpy8NtH0TpQ8OjESFXgKWDsjv16
	 1CwgdDQTe12UA==
Date: Tue, 16 Jan 2024 17:28:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: remoteproc: do not override firmware-name
 $ref
Message-ID: <20240116-subtotal-urethane-35e63c7433db@spud>
References: <20240115182031.1610088-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1syrabisp+vFZ/Vi"
Content-Disposition: inline
In-Reply-To: <20240115182031.1610088-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_092904_721391_9B901D32 
X-CRM114-Status: UNSURE (   6.97  )
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


--1syrabisp+vFZ/Vi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--1syrabisp+vFZ/Vi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaa81AAKCRB4tDGHoIJi
0icdAQCcnGevmqgCCTEYkJuG6/u1PQcTwyvQMCVvh4SuWtK5zQD8CZft2NykhSW1
4Y6FpR4ygdfT3yOqtYhTrky6s0iWUws=
=oRqr
-----END PGP SIGNATURE-----

--1syrabisp+vFZ/Vi--

