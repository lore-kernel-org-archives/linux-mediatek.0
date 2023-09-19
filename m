Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0E7CD54AC
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 09:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1W+RHNKneW2lSWYUJv9c0K/rO7LlJrAh0C1ermQDmPM=; b=dHdPIclPhAC2S/cl17od2X6kXg
	rwLia/Rff14vUNjg650NJCwTqpdBKmvKq9MPgTc+mww4gotHM1kYF4Yi4wceMTSTsi8lcpQCt/vIo
	sZUsFXkpre5Req0Mry4/YmwuctDJC9airnBCtOoadKCp/0gaUmfEYKYG4aMHLoVMfQN/oNyym+MbJ
	dg9zIfSVPhxsJWxsW1m2kxwfp2AqXJm0T6GS0f3KmlRxVnPEFXnW9sv6iBd6CsTZrtA54hOTXxCow
	TRqd3gpI3Y5TIvecCMoiq476z0dI5uB0CMOlTN8m4yGnCyVZI4fiGef0gFOuS7OGbSzTkhT0khf0O
	WXZUWy9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXDc-00HWLE-08;
	Tue, 19 Sep 2023 09:40:32 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXDV-00HWGb-2B;
	Tue, 19 Sep 2023 09:40:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id B1D61CE126A;
	Tue, 19 Sep 2023 09:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A781C433C8;
	Tue, 19 Sep 2023 09:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695116422;
	bh=1W+RHNKneW2lSWYUJv9c0K/rO7LlJrAh0C1ermQDmPM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=dYfspwzi29ZpE8TGLJJHwniJ0FECLJuib/RKR7Hy666KEaxriDEmslxjOEAfCnaxI
	 zSYA1GYxhamjWYym4bPvYUC0Q0AZo6m+HoSLT1vcJjZcDW9mztF0XmpOJr0ar/TGGH
	 skHEsbWaGdLXm2gwctjZTyLoOgoEw3OhJeFZUzUki9nbOk0NtDtswAy1g5dQUW3QY0
	 2+0yN5bMzBMWMB3PI326g1n40jKV6fIHlDperqFcYLJok93eqXMNMp6qVEZTvF5TcW
	 fVAHGI3usWzY5c+WiaPLfbomx7S8Rb0WLMGN7I+YIJv+FDRW0oRn1JRaxRSakGuBrR
	 8QyCyIZvKiVnQ==
From: Kalle Valo <kvalo@kernel.org>
To: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org,  Bjorn Helgaas <helgaas@kernel.org>,  Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,  Lukas Wunner
 <lukas@wunner.de>,
  "Rafael J . Wysocki" <rafael@kernel.org>,  Heiner Kallweit
 <hkallweit1@gmail.com>,  Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
  linux-kernel@vger.kernel.org,  Jeff Johnson <quic_jjohnson@quicinc.com>,
  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,
  ath10k@lists.infradead.org,  ath12k@lists.infradead.org,
  intel-wired-lan@lists.osuosl.org,  linux-arm-kernel@lists.infradead.org,
  linux-bluetooth@vger.kernel.org,  linux-mediatek@lists.infradead.org,
  linux-rdma@vger.kernel.org,  netdev@vger.kernel.org
Subject: Re: [PATCH v2 10/13] wifi: ath11k: Use pci_disable/enable_link_state()
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
	<20230918131103.24119-11-ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 Sep 2023 12:40:15 +0300
In-Reply-To: <20230918131103.24119-11-ilpo.jarvinen@linux.intel.com> ("Ilpo
	=?utf-8?Q?J=C3=A4rvinen=22's?= message of "Mon, 18 Sep 2023 16:11:00
 +0300")
Message-ID: <87il86biww.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_024025_959333_83D8111A 
X-CRM114-Status: UNSURE (   9.60  )
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

Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> writes:

> ath11k driver adjusts ASPM state itself which leaves ASPM service
> driver in PCI core unaware of the link state changes the driver
> implemented.
>
> Call pci_disable_link_state() and pci_enable_link_state() instead of
> adjusting ASPMC field in LNKCTL directly in the driver and let PCI core
> handle the ASPM state management.
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

