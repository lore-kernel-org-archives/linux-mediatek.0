Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EA4CC6B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYeQNT3tjV04rlnvVwiGcycmzog7//CwXI+8H6Sk9I4=; b=LtLtcip5CG9+Kelmc90hc9V6jT
	urQbD4/bBZOmi1o4lBomnHxC0ElL9741AyPHRwcAUydYvBBDMeC5UBZ3PPA0mdj1KNpTmO8a67Ck3
	PzchDaSRCtMZ2Arxm0DZ4EHMtV97cVIU8QA4E5a0O/7mI3tDkhXDEbw9MlxYd9Zlxs+XwFabUcob9
	tZqbsBD8ZbkA8I02lPKfFBMojeTkul3zqHGiexetfvG56UittIkEdMAurgMqoJHqEfIpGO1DX/tJD
	Yp0qrKC8oGjMCfXPupPILjWLG9gNJoUMonqKT6+lYh+SjIaFWTzuxUXQN0dXsF3qhsINxVccJoeWA
	+g7fRwsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeBF-0000000DEQP-3Tp0;
	Tue, 13 Oct 2026 15:12:41 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeBC-0000000DENA-2Uwl
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:12:39 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so24617415e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1791904356; x=1792509156; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYeQNT3tjV04rlnvVwiGcycmzog7//CwXI+8H6Sk9I4=;
        b=ZORHDIBXmEslYK1MdcUI8PktjT0G1HtxQ+/D/AH3PxB9AIEIn8ME7klHndCd23c0Xe
         v1YWTpk8QLFsSeLkXobz+eAroZ12U/lhRFGDQclQHM2jtSsWMToKTQ7osYgkVxQscnAl
         9U4gTgfAMA/u3O2KVwGDA4now6Y13c3zZaJ8CYjvBlCNrhrgpYD27hnQvaY3/Z0vi+aL
         Hh8A9zO4NIaDQp/ukJzApWdlMs0QM2ovUc4yhZ/gmrgj2HFCybRFUTxznWpHIbYFF+Qe
         Skz5G2w1cvdOtKrG2xAUQHMsMPXaz0IrxjoEVXaYIcrdFi2SUdRH7V0ci1gNS0nGKmDV
         boOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904356; x=1792509156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYeQNT3tjV04rlnvVwiGcycmzog7//CwXI+8H6Sk9I4=;
        b=c4XR6QqYJYfBBv3D5RT4zexP08BceNmti4S7YqzMXckaAkUJ2Yyyj/GzFwTuDyn6ke
         Ysou74BlZBjWyiKGPFexn2FUOXUFZq+cYJ7BLVrAqYUFYSjAJ7PFhH7BgqacoRoJbGOk
         8lqt9fVS3UsZ/zJfwrxvDHBgwQcrnzIIyMBDNlGXl5KQp5RfuSQmTXM0DLNkMe2EPrZ6
         cvzQrzIEA82SsqrkiHYYxNGLwcfBqGkmmI+JLtflc+S+/QeS1nfJaP/dn0fj5WEM9LJ2
         hX+XqgcHivxpA/pnOAmUSL0VkmxXNKFfUEgN8EuUrSMk3qnnH9RExXakMp1lO2UODFI/
         x6HQ==
X-Forwarded-Encrypted: i=1; AKwUvBwT0GCrn4GWz/3HY5husZFIy4aEwaGbVGkHvig5IW5rQcCIvMrUvYleTebR2Xx53pztOCfTab9tznYuLdXfdQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYISnsj3LpSe0WOx+6HOHJ60MrW2ABcvjrqwmeHodtvfDEGxNPLs
	f55Y68ww8VHK+96veCG2ZlXlxlwKBY96hyIcrxV+Ew5DW4XhTQMurnnBEHn4CUR8zG0=
X-Gm-Gg: AYBFou3tlc9YCS9BJ/xdyzTeZ/fXrccC21dlGPB/9hkelBUz15JXFUMbcMLy9cbTZ6l
	AC6JUWZXCpVfca8BhFh/am5HgybpQz90lyXTbGpJuVKwfV8LANVa/dH3ESM5XGlmkKnJA6vV0Bv
	zqY7jDDkRNq4f00ZYl7CV9S04+ErlqSpVM63p8SMrVEpPUTEpha+fo5f+OituEZRbeZaB0sYFNB
	9Z15uDS1P6efOiGsgotxXO19pWMzKgPK6bO90tgnkgTlYZCeONwX426ABho4PxU4Ao9sEUkvQTE
	EsOUdtbCztZK1ceEPg0m1F3obIEhftmtHzusZ9v7oZ/84U17XIk5imP1Lrdlz//NFJ4KEO/hWBj
	LZ8dtzNHWHQ9S99XG2qu+nI81hMNBvBIfSoO3DjFrbPEyirybJWc+9NXRd51ZdCWQfBOU1tHZOZ
	D7atUSgTNA6k2CfygjKowqleVSr52CO0+qMr8s9EpAXambT4RnkA==
X-Received: by 2002:a05:600c:3e8d:b0:4a1:7701:f863 with SMTP id 5b1f17b1804b1-4a18e4aeae4mr233814475e9.15.1791904355994;
        Tue, 13 Oct 2026 08:12:35 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0967c03sm5740158f8f.6.2026.10.13.08.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:12:35 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v6 0/3] net: phylink: wait for a PHY that probes after the MAC
Date: Tue, 13 Oct 2026 18:12:33 +0300
Message-ID: <20261013151233.2474217-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aa01ab1c-da2c-4638-816b-f535b635379b@redhat.com>
References: <aa01ab1c-da2c-4638-816b-f535b635379b@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081238_657721_1B31C1D7 
X-CRM114-Status: GOOD (  11.49  )
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

On 10/13/26 09:53, Paolo Abeni wrote:
> The above looks like a significant amount of complexity for OoT driver,
> and I understand it could be solved with a different kconf?

The PHY driver is in mainline, air_en8811h. Only the board's device
tree lives in OpenWrt.

A config change can avoid it, but it is expensive here. Building
air_en8811h in is not enough, since it loads its firmware with
request_firmware_direct() from the root filesystem, which is not mounted
yet when the switch probes. It also needs CONFIG_EXTRA_FIRMWARE with
144 KB of blobs, in a kernel that OpenWrt shares between every board
of the subtarget.

Is that the expected answer for a board like this one, or would you
take a smaller change in phylink?

Aleksei

