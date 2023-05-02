Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CD8C77B7E
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 May 2023 10:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fuCCjs/TuYV/kdxEssyG9fBViHn9SkyVnmjJ20wEqs=; b=TyuPlUyu/ed00GbKeqYSTbWQFA
	bBTymilRMxAGRVfDj/QQcW8qx/E6vOLalJwmlpxjyy5BR+bLSLOg0vSjauibLgElJczYTWnGid68V
	w9fZ71V02W+rswZvmhr0sS8piQjsS94L9vxtW4rm8iQ7HFzndaUPIIzD6jjO9ULvgmyXE94kbb3tS
	turo7PxzbxH5Cfh2jkCPMCX6pkZDqocY2kDrrBSrT10mERPDwua+hvG9NPg/aLsQ6v6gbxo8w/ANs
	UTSQK/Il9fNhnI2k4PBD4u35pob91VSlP4VOvkGMmTqMlHS0P+JqSZwQZF9e6rpzR99jp0zRP1Mvq
	ch7JEKBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptnKV-000xTl-1D;
	Tue, 02 May 2023 10:33:55 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptnKR-000xRj-2t
	for linux-mediatek@lists.infradead.org;
	Tue, 02 May 2023 10:33:53 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-24e2b2a27ebso506097a91.3
        for <linux-mediatek@lists.infradead.org>; Tue, 02 May 2023 03:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683023629; x=1685615629;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+fuCCjs/TuYV/kdxEssyG9fBViHn9SkyVnmjJ20wEqs=;
        b=af2cIXWlSqt3grnqXOjULu9dBmX6JlyAsdsMzZ2ah5y8Bg7NJV8LrvhRgsF++6JiOJ
         GHKBVYgTXvPo0u6l4VWjHP61F2l0pVb0QN1LFhzmHPnIBaVAlgjfFO5mFKToFii46g43
         YD8RunEGDJ0ju6TNbSmVlwCIHiLQ91ONmioPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683023629; x=1685615629;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+fuCCjs/TuYV/kdxEssyG9fBViHn9SkyVnmjJ20wEqs=;
        b=EkpD/8S0ZuVpFD75DiGB+Rds61iRjZFPuwgFdl9YhkbJD07XqgsH/PzkNXDjBG3B6t
         OC7Hg/26Vpn/HTYdOQWjyDe5+N1/JZTkP5pj81LSXzMIkQiZCiXZYg5QfWzqLmcqlCCU
         ba57zs4CsJGqmrITK5Ag749a6vjpA7xdm82sg9fqL2vhrWhBaCXLAVpzr/lfVDdsO4lb
         9ZxKMOh5bWQFbJNsvzmfuqBWG5dG00AKZX67XFWF2tlcLykVM+AkKWLUm0qq0fL74nnH
         gaUkKE/XBg4Rtz3PqMtbFyUnLRt1yjARBcOuEo9aC5LFH8fP/rG25gQR5Rk5Fk3rZDNT
         z0Lg==
X-Gm-Message-State: AC+VfDy3/b8I09rs1nL+ueMEE3f/fSeZRBzQ9ENUH0DWvVUEnqTLYm8E
	zu69mvpYSDdnxKU8xKcof1VWLg==
X-Google-Smtp-Source: ACHHUZ7D5b++XGhn6qJsIBk064qWgKtkGNwvj98P5C8vUDm8zn+JHtAlSMG7N3iifFpFnF9FClShVw==
X-Received: by 2002:a17:90a:8182:b0:24b:6d50:fed8 with SMTP id e2-20020a17090a818200b0024b6d50fed8mr17168034pjn.24.1683023628961;
        Tue, 02 May 2023 03:33:48 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:b873:4627:7ea:a0dd])
        by smtp.gmail.com with ESMTPSA id y23-20020a1709029b9700b001a69c1c78e7sm19465521plp.71.2023.05.02.03.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 03:33:48 -0700 (PDT)
Date: Tue, 2 May 2023 18:33:44 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Alexandre Bailon <abailon@baylibre.com>, kernel@collabora.com,
	Balsam CHIHI <bchihi@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Amit Kucheria <amitk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/3] thermal/drivers/mediatek/lvts_thermal: Fixes to the
 interrupt handling
Message-ID: <20230502103344.GA3388518@google.com>
References: <20230428195347.3832687-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230428195347.3832687-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_033351_934222_22E3CCE9 
X-CRM114-Status: GOOD (  10.81  )
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

On Fri, Apr 28, 2023 at 03:53:44PM -0400, Nícolas F. R. A. Prado wrote:
> 
> Fixes in the interrupt handling of the LVTS thermal driver noticed while
> testing it on the Spherion Chromebook (mt8192-asurada-spherion) with the
> MT8192 support series [1].
> 
> These are standalone fixes and don't depend on anything else.
> 
> [1] https://lore.kernel.org/all/20230307163413.143334-1-bchihi@baylibre.com/
> 
> Thanks,
> Nícolas
> 
> 
> Nícolas F. R. A. Prado (3):
>   thermal/drivers/mediatek/lvts_thermal: Handle IRQ on all controllers
>   thermal/drivers/mediatek/lvts_thermal: Honor sensors in immediate mode
>   thermal/drivers/mediatek/lvts_thermal: Disable undesired interrupts

This series seems to have solved all interrupt storm issue I ran into, so

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

