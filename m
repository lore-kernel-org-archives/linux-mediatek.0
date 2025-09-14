Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC78ACAC582
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Sep 2025 11:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05ZWoSoCpXTd7kMo2D7eZ+9NOL3Ymr4GMs5H07grvQg=; b=fxjnFHySk/0vR+nKGBe4nyTSjl
	EFKo62Da2Mdvvsacai4xm6au6q14u+bbzEIN0OtJzEEvx545nyiGzziBP9K83HSI70aGyalmAb6OD
	oOETnXkB0L5vBX3rGH7OraeR6G+01iD+Mtk1ZhgJwWno1WkysI3HbAmV3PtmtshOUZ6NXLLU6IPfR
	7DgnD5XhoDo4+4IIoB0IIANWO44I9QmPcc2u8SjFWJrQCiOLM0G4n+Hoa9FsJx5VjaIkm0AXOngTO
	ZofqjzDAegtesvh3vrhoi/8uuPcgVuT7ATs3f8ZVRF7dLWNNELv0WZL58cuAFej8b41gTx6JLk/bG
	TYkpRpeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlGv-000000011Tv-2PJ9;
	Sun, 14 Sep 2025 11:51:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlGs-000000011TE-0EY8
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Sep 2025 11:51:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757850711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=05ZWoSoCpXTd7kMo2D7eZ+9NOL3Ymr4GMs5H07grvQg=;
	b=gTkjKwx56HG3L/6Jd8p8Zge5zRjHrLS1m4v3+nYZxqxyIOsbJYkcQtSR3FvHTV/3bAkH9l
	qxM5L7Oson5P2UoxpOILEXTUscojoy75ZahCLE7kV9Vdbu3LvHgZOVmSZxYbxRe3a4wz3L
	NfLO7jNYT+bT6OyO50CzINcoKHjX/zw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-YBQzLskTOVWPuNzJxad4Gw-1; Sun, 14 Sep 2025 07:51:50 -0400
X-MC-Unique: YBQzLskTOVWPuNzJxad4Gw-1
X-Mimecast-MFC-AGG-ID: YBQzLskTOVWPuNzJxad4Gw_1757850710
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-81ea2cb6f13so715699185a.0
        for <linux-mediatek@lists.infradead.org>; Sun, 14 Sep 2025 04:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757850710; x=1758455510;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05ZWoSoCpXTd7kMo2D7eZ+9NOL3Ymr4GMs5H07grvQg=;
        b=X5BGWszXTYFOtE4wkP3thRVtj6Gs3a/rE+ynnPCAA9DK3Pd/64AfoKzQU9D6W0ldZa
         lB59Xc54x9LtjbsKQe6cKYrYjkmg0JoB41MI0swBSmZC3A6AFxafUni440B/kXnv6zfW
         PuRPxv6eXz/MYgL8jkzCwh1IUkkAW9EBOr2Kv89UPKxh+FbFQwVAfpHKkAcTVgKKF6qY
         ZPtLckMkxb68NW8NOtdkRFBFM4lQUoVle0fYEr5v4tmFvuxzfSU+74aCQISS9AW2RGIE
         2abrnjHBFpqeCvgqLD4jw+1+bvZ+2zpfVSbLIrCYFmtGYudlpeHHUt98dHlMUTrYAhWg
         L2OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYfbCjUe4Cft5xQZMfcYvNn8JAJNsXLR12bFmHGJqZ73UCMda0cKmGHX0I4s7+F7XplRaDrdMrqE1vu7Nl6g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx71I4Veg0sPGYTC93r3QXptO0JFwl6mB9DLaAKIOTfSjsHB9Wb
	WWxdCFH6cMP0U+vYr7JxsplfF2hAom3Fyg9QVrhOTAtQfsnGQ2F8ngHQ8Nnv6QHl2KDDq300HPm
	0hoTZf9q4bwUh0bVLRNkeOl+u7XnS69RomFvoYvKJID0txvtlWkdgKAT0EG23SL7mi20UyMguIg
	==
X-Gm-Gg: ASbGncu6iYeJt2/W1XbTaBJqNquTDmZpjIX9q01EhMPD+muRopOjBFoDim8jORPZw5B
	b8iWxbloOxok1UFFTZffCzCpUtY1bXtQLzKyxGEm82oHloNN4YjarwZF1NJYzKrHYVRLR1/ZwOa
	65ZrZ9amPZcpXb1c+xVOw/xJht5i4StIM+SSBdmvCh9K1has7sD6ZdEfZfLdWmBcbvRxjsmsG41
	kKssgOqaXWX4uXDow23xMBvCi20l+YoI+BQHEzP3IWAo86K8BZBXbw1OoZOx4JrC1MJxshxsNY8
	pXU6mZ18RQNTl6L0ot2RcmXVwGSDr087Dyi3NhHj6shjwMmJbXmmu/flT7c+gwmVIXly6LgfklQ
	YvED66kDpo5CEK4QQYiQ5MEBawPgEMpE=
X-Received: by 2002:a05:622a:409:b0:4b4:8eb7:a461 with SMTP id d75a77b69052e-4b77d14bab4mr135163501cf.58.1757850709648;
        Sun, 14 Sep 2025 04:51:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL+XRwnX6jGuwsu4a3hT4crD8COQvyH3Zc5Sbne0Nd2VMEI38oG/sulJqcdFsNqwfss3aWZQ==
X-Received: by 2002:a05:622a:409:b0:4b4:8eb7:a461 with SMTP id d75a77b69052e-4b77d14bab4mr135163311cf.58.1757850709265;
        Sun, 14 Sep 2025 04:51:49 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b639da9e99sm51613881cf.29.2025.09.14.04.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:51:48 -0700 (PDT)
Date: Sun, 14 Sep 2025 07:51:45 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] pmdomain: mediatek: airoha: convert from round_rate() to
 determine_rate()
Message-ID: <aMasUV14w0Dc1ki0@redhat.com>
References: <20250810-pmdomain-round-rate-v1-1-1a90dbacdeb6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250810-pmdomain-round-rate-v1-1-1a90dbacdeb6@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dXSAwecJd6WkDzWxoR5-pA3-CHI6h4SjX0bQE_5W71Y_1757850710
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_045154_480797_EC2F4AD0 
X-CRM114-Status: GOOD (  12.68  )
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

Hi Ulf,

On Sun, Aug 10, 2025 at 06:16:19PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> appended to the "under-the-cut" portion of the patch.
> 
> Note that prior to running the Coccinelle,
> airoha_cpu_pmdomain_clk_round() was renamed to
> airoha_cpu_pmdomain_clk_round_rate().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Would it be possible to get this picked up for v6.18? I'd like to remove
this API from drivers/clk in v6.19.

Thanks,

Brian


