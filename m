Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B655EC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 15:29:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C25A60FC2
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 15:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C25A60FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAr6Ce2hpufNPJj9d73eCLnyZsVX4515fkDnelE4nuY=; b=FrHS4+74mqcaIM
	plhjfY07C3yZzQi9mzQZwQC3dQQyC52mnRWw/Jb6J8tnK0y8o54B/ZJt3TfmOWorPkoU1BuKCuPXf
	iX0wJeRnhKCFHlrulwDrWleQNytEYLFO1dNsxaRL5D2VhkmP0OcFeWo2fTznn8oLznFxpfI2g9oNF
	ct/HUYRiRFfXqgbM9OXCG+D+nwGJqhbkGGCvLPbJiDGrHJa0UU54xgb9/vCSnN6AT2SThCkhmCwAY
	F650hKS0ZO3WWtyC64TSnMSN97yB0O40UP9B8Iykogai2N78p7gPEfslHHTA0GaPQP1OqhbIf63cT
	Sf2yOAsQb/GDYDwWez0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAwM8-003PGN-K6; Tue, 03 Aug 2021 15:29:24 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAwLw-003PEu-DO; Tue, 03 Aug 2021 15:29:13 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 j18-20020a17090aeb12b029017737e6c349so3157714pjz.0; 
 Tue, 03 Aug 2021 08:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=TlfK2VJ6iI6/r4Nhmzrn4xmy7cO/lNNzYPI68RNrCFQ=;
 b=fTs/Iloe6nn8kpH7p7BX16GKQoe81CLly2hJENeR9Qj7CindAwu9tAhFbrRRZC/euG
 tlf8FkOzthBGdNkPoTCoo0xxHvFBmdThHm35IOUzwelepzVFbWtp2DylyW1T9NOhUHgx
 5iqBvvdKtq1Kz3d/6cfa9fM9ntigN6X/W92bEWf3bCdLdU3idj5tm9FNOmA2ZqkYBI9l
 3yz4iUNpJqVPtEt6mvAxkf7gzM97Mg7VwLFa4TRLY+JPA4XhX90KDfMh7UoPbtuJrqYH
 YZwcchAzRdB0mFb9b4zBTXmCEpkYvFM1qIc6kqhH18gxRPU88ZXYZshWCsOhBJbKoqcM
 TVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=TlfK2VJ6iI6/r4Nhmzrn4xmy7cO/lNNzYPI68RNrCFQ=;
 b=HXCnvdl9stJRl3kGtJ7AZkAwed6ekNj5dzDCaWxtcByHzEmt14fFDiFzChnJvFmEhR
 uOp4MPmDfdoCQ+fNlBIFzX/5dTlawQQbWh9R/1GASL77ctUx5GfLq927DUXXXm55RJUu
 aflngsF+MjatiHMQ0/99QFwOr8qNBKods/MgqLn6KPRZGEbBMivCHWEHw0N15DKcjK/b
 EBOBXB2heRJ12xVKoQP2hu4YzVtL6CA/mvlJD2fKoWKvU/EINJ+QIERIP2saBO5g81Yk
 NtTAR5U2kpS11pM8WA080J9X6Oria1x0KKjS573Q1a0Y9p6RzKvKzK79khLFq90cO0yQ
 BtDw==
X-Gm-Message-State: AOAM5318HoG6WN/BGi5x8oLxIRsOaw/r3iXuLisGiQt334GAbtGgj7Jt
 1plYUwWaR01ADTABZljsy+g=
X-Google-Smtp-Source: ABdhPJyWy13jq6LAmzzH+btwVFS22zDWog94fqgmyTGBy8+HveSaFu8pfbjvptmpLz0rQ/dMQhP5PA==
X-Received: by 2002:a17:902:d383:b029:12c:bebe:725a with SMTP id
 e3-20020a170902d383b029012cbebe725amr7086064pld.24.1628004551377; 
 Tue, 03 Aug 2021 08:29:11 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id g1sm9205786pfo.0.2021.08.03.08.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 08:29:10 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eric Woudstra <ericwouds@gmail.com>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: Re: [PATCH net-next 4/4] net: dsa: mt7530: always install FDB entries
 with IVL and FID 1
Date: Tue,  3 Aug 2021 23:29:01 +0800
Message-Id: <20210803152901.2913035-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803144552.fluxxfoey2tbqyyu@skbuf>
References: <20210803124022.2912298-1-dqfext@gmail.com>
 <20210803124022.2912298-5-dqfext@gmail.com>
 <20210803144552.fluxxfoey2tbqyyu@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_082912_496225_11C444A5 
X-CRM114-Status: UNSURE (   9.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Aug 03, 2021 at 05:45:52PM +0300, Vladimir Oltean wrote:
> 
> Maybe it would be good to resend with a set of #defines for the
> standalone/bridged port FID values after all, what do you think?

Will do.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
