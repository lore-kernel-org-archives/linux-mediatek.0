Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE8AC87FCA
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Aug 2025 13:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aCwOQzZcZp/Xl1H7lLeksF7ToOJINQRXKmshGvKKt6E=; b=lkUi6Pzf1i4hC0D36t4R9Sz0AV
	MR46mxApqKVh4UIlQ6sppt7q2fcJcDCIbZeAU1ACHUjMKZAjv2WmMBIipzkv1C4X7/9e7Xkspqubi
	xsVym70utzdv49YqQEj0KAOLbFVLW7V/VIjy4/tLqkuVTp0bWTBw2Hv8djD/MuXAEO5maLo1l+JW8
	d0t59dGaGmZ2CuvoaFupi4fZi2Ksnlv5WTNT7KvBcalnUGUdofLv3P/NXM1uXPYPVCiFS+HFnrgWZ
	Pz7MCBzM7JjU0iKqWx5zJ/Z+W1HtVaCdwbhVvawVJAmIbVNTyxDVODyMGi0w6jbNltRBBusAezzgZ
	2niuySBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpnH-000000066kM-2W9R;
	Fri, 01 Aug 2025 13:27:31 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpew-000000065pi-0LZt
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Aug 2025 13:18:55 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4561ed868b5so12529195e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Aug 2025 06:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754054332; x=1754659132; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aCwOQzZcZp/Xl1H7lLeksF7ToOJINQRXKmshGvKKt6E=;
        b=G/qKv98PLhpeSigLDcDibKUFXcuzQEeexoyRG+zFF1zdil0NtlW9G4fG/ZOI0NbY6Q
         2lppaFvS6bqsTYjAmt8dcMDey8ZOhkcbDPCPsDzZdO1PrgO41uSbAED1o3F/2aN1uxYF
         ONZCX/fvborLBDSgD1fh39WlF3aKDrBcIPyvhqbAAY3m9YROaQfej4seaiy/uKdxkLo3
         sIMOmMllFt1Yrw6AXna1Td9+EGC95wE4w2r1zgMhrwmzRwE3JBIyci0xVYXCPmBrVVdl
         bkbcVRO3WeOhPcLJhmCmQ0s4Nz8aRAus+Y4eR6cY3hzNTOWVpY9fZmAJKzszvUoD2lIQ
         MJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754054332; x=1754659132;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aCwOQzZcZp/Xl1H7lLeksF7ToOJINQRXKmshGvKKt6E=;
        b=aBDFweZvNpCLnUymrZJnd4oQhrsl8rZAhegQjWVzuOSoNLnTptzzRP69KSM1HejcD1
         YnuDUwGg2OxYo01gKeH21gKodm1PoopjjRmDiJwzQGwmL3FK/yks5oIUmZ5oBAdW7Ujy
         Z4cwvJxSfH+aVHlcIVGyLgoF9QnEiqlqTU1QXAdzAnuz/mJjVFkdbr+4HwW5yvhpFXXp
         ghxRcSdcDE2BD/e1dKQeGIaloz85gy8e127cGqss2NC5M61u1c+aWC3L7/SI7sWmA20s
         VSvApYNJwMfsNnmcZLApa/Pr0cuVx6e0QlZmamRm7cEVRKCdLLfRdKNIXL/oNm+PvFLY
         mTZA==
X-Forwarded-Encrypted: i=1; AJvYcCWJGlgd294bv/FF+qXnAmuKGNVkOaVB0IHywmX3jCAknYK7jZvQHEq+BpNW+xV4wfjNeX4pw/e+g8YzdCAfHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf5gpxXmCwI1LCbNYbtBMw9BTzuqnKgfWYOwDY55JfhpfllLkr
	Mv8qfJMauaCViFIUy2xsvntEAxQOkjegA14s6G9lAGmt38HcSmAqcGZtZBrEPOsqK98=
X-Gm-Gg: ASbGncsVs3N8HnV/98EuRITai/4JnnA+8TsMxT325ml6TBhXr6iapdZdUmnFjY5W5Dn
	qCRDlaRDdy4eTd+XDxf1RggJzbvFPmvrfxf66wsCYTIvRcNxbrw57zY61L5lo0/79oYzzsyovbo
	2PcKdcJ5fh2nEBO4wJKHJNd3NwmUALvkE+d7staE89Qt3uZ0CNLm+Oquu88i1hc6o8DfRn05E0H
	AkdapgZ8LDRgCh9OYGdtV0tCbhw3h8Uu4b+boNhxgmQtU1llVcwbvxkd83WRHP6eL4f9i1jR0R5
	R5krAamoccsjZzWualTBhvZsRekOXOzVPHEd/ZvsOAs011PhyZd+m11oOkOXNL0tGzs1PKii0q+
	2K5AbaI0KTggWImIEWfzortAaGiE=
X-Google-Smtp-Source: AGHT+IGL+p19TEPnElONLr5QZS+wXmAxM9ezIq06esequDkgY/lXWnvPQSz+MHavSQeoEuRJjBR93w==
X-Received: by 2002:a05:600c:4927:b0:453:5a04:b60e with SMTP id 5b1f17b1804b1-458aef01e97mr14488965e9.26.1754054332293;
        Fri, 01 Aug 2025 06:18:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c4a6f6fsm6120989f8f.74.2025.08.01.06.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:18:51 -0700 (PDT)
Date: Fri, 1 Aug 2025 16:18:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peter Wang <peter.wang@mediatek.com>
Cc: linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] scsi: ufs: host: mediatek: Set IRQ affinity policy for
 MCQ mode
Message-ID: <aIy-t8rS0b8vhfmL@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_061854_129544_619F0430 
X-CRM114-Status: UNSURE (   7.30  )
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

Hello Peter Wang,

Commit 66e26a4b8a77 ("scsi: ufs: host: mediatek: Set IRQ affinity
policy for MCQ mode") from Jul 22, 2025 (linux-next), leads to the
following *UNPUBLISHED* Smatch static checker warning:

	drivers/ufs/host/ufs-mediatek.c:827 ufs_mtk_mcq_get_irq()
	warn: array off by one? 'host->mcq_intr_info[q_index]'

drivers/ufs/host/ufs-mediatek.c
    812 static u32 ufs_mtk_mcq_get_irq(struct ufs_hba *hba, unsigned int cpu)
    813 {
    814         struct ufs_mtk_host *host = ufshcd_get_variant(hba);
    815         struct blk_mq_tag_set *tag_set = &hba->host->tag_set;
    816         struct blk_mq_queue_map        *map = &tag_set->map[HCTX_TYPE_DEFAULT];
    817         unsigned int nr = map->nr_queues;
    818         unsigned int q_index;
    819 
    820         q_index = map->mq_map[cpu];
    821         if (q_index > nr) {

This really looks like it should be ">= nr" instead of "> nr" but I'm not
certain enough to send a patch for it.  Could you take a look?

    822                 dev_err(hba->dev, "hwq index %d exceed %d\n",
    823                         q_index, nr);
    824                 return MTK_MCQ_INVALID_IRQ;
    825         }
    826 
--> 827         return host->mcq_intr_info[q_index].irq;
    828 }

regards,
dan carpenter

