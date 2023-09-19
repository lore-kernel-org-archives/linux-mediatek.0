Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A908CD54A9
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 09:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+3hur1NYakFhwVVM9QubHkOlW+nEYeKslg6uKnJKmU=; b=P3B9W5/6qkP9c7z1oy5+hUsTpP
	nlrXhTMw3CQPvprRdp93c5oFO8DENQEWVcdOK0/4BNKKYP1F3oU6nEBBoHYoCa14R5bXHL8v4iISe
	wJ3Rtxrc8bwsYjDa4wdA6VT3nnbFiknwr+o/AhyAo2Bw8tM4KpKUhj5WHY1JP1yL70lKdgKbxlfQh
	frRSMMgQcgUw1PtcHGANBiiQv0H/rqtpjbd+grzzBXAioiWVWjIxJikFE7y7YuRhqoWGFiwxq10uB
	vTEXXd7umyJzOu1pSlGD9ikWYzb4Gkf4d5nLvI6YhAhlXhc5ppAqLhiMq2Qg66HCYcvoCF2/kHTWT
	gTJ2oYhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXEE-00HWeg-1E;
	Tue, 19 Sep 2023 09:41:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXE9-00HWb2-0e;
	Tue, 19 Sep 2023 09:41:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8FE0FB8117B;
	Tue, 19 Sep 2023 09:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA312C433C8;
	Tue, 19 Sep 2023 09:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695116462;
	bh=m+3hur1NYakFhwVVM9QubHkOlW+nEYeKslg6uKnJKmU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=CML037E+zpEE3oZZc6aRLXqmea6pNid/66KYalApNxJSjydgAg0WstMAoFXN+hJt1
	 I4xt00gNzk3Qs290qAspY0vBXL2okCcTREoiXyFqeb4w1okB2ISdofz3iZS2abZOi/
	 siE9o8KPpUQfhz5/DuJ2gIDlrC1ONtdyfjpy3JU9vIFH5zWwSOhwWtLNz50zCrdeIM
	 ZtOaUscuX6VwtJjEyUmovQxRjGYtisMfGH4dXBoGxZGdkEiYTgdv+nF9l0Y4CtuIBc
	 9Wnkbpsu0I7bev8qa0W0yXdxbSZwOtM1rRCXioy1HFeq3udvFr1hpMc6v4rdqTu+6Q
	 P0yXf7kKd4jXQ==
From: Kalle Valo <kvalo@kernel.org>
To: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org,  Bjorn Helgaas <helgaas@kernel.org>,  Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,  Lukas Wunner
 <lukas@wunner.de>,
  "Rafael J . Wysocki" <rafael@kernel.org>,  Heiner Kallweit
 <hkallweit1@gmail.com>,  Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
  linux-kernel@vger.kernel.org,  Jeff Johnson <quic_jjohnson@quicinc.com>,
  ath12k@lists.infradead.org,  linux-wireless@vger.kernel.org,
  ath10k@lists.infradead.org,  ath11k@lists.infradead.org,
  intel-wired-lan@lists.osuosl.org,  linux-arm-kernel@lists.infradead.org,
  linux-bluetooth@vger.kernel.org,  linux-mediatek@lists.infradead.org,
  linux-rdma@vger.kernel.org,  netdev@vger.kernel.org
Subject: Re: [PATCH v2 11/13] wifi: ath12k: Use pci_disable/enable_link_state()
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
	<20230918131103.24119-12-ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 Sep 2023 12:40:55 +0300
In-Reply-To: <20230918131103.24119-12-ilpo.jarvinen@linux.intel.com> ("Ilpo
	=?utf-8?Q?J=C3=A4rvinen=22's?= message of "Mon, 18 Sep 2023 16:11:01
 +0300")
Message-ID: <87ediubivs.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_024105_370578_607E487E 
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

> ath12k driver adjusts ASPM state itself which leaves ASPM service
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

