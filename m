Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E76606A31C
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 01:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JDdwputD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oj0vkI1a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-Type
	:References:In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HZ2sCqXwwWM570Uzj7/jKB0ciamWJ56LEpgiUf6Er7s=; b=JDdwputDR0hPAS/8eXv9CoY61M
	IM+gNWsUS1I1bbVqDCW11nJQIxPS0LVqSJnDJUACr0XJKyL4t+bGQ9BOU2mEdoeC+f9GDMnU8nOeX
	dM0xUh8zv92RofAX5Uu2BrylEcltvc/P4CoYy9h9TyuM0rNAdXbNwsuVkzkVjo27HzIM+0+AukbtF
	E8dJv0WCAycngKG4Albiyz97u0e0Tx+yIc51bOyj1ebUICWyhr1P7lh3b+5/26ZYlO4nS9aodh1fw
	+gIoF3nrE6drK885ke0/xkvbVVbdnhpZfVTKeA5ATOXCeNDIDpmyA1daKf1rNCK2XiTJpJHKYAbCN
	UKsvb2Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWkUD-0000000EiY5-2We7;
	Fri, 27 Nov 2026 01:10:49 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWkUB-0000000EiXk-3ahm
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 01:10:49 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2f0481b35c9so43271835ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 17:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795741846; x=1796346646; darn=lists.infradead.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HZ2sCqXwwWM570Uzj7/jKB0ciamWJ56LEpgiUf6Er7s=;
        b=oj0vkI1aCzvZ4lzx2kzwbQaDktqOeebfkt6al7UMtNqCKmP2aqXUchumArfi3pOgh7
         EbCIkV7PWNNIPYusJ2c1aip8SnzWTPGbtF+YUBTpIj4hTxFI745mzFs2R8yunZ31vunf
         ggyLJkOf0zg2CkLlDO/hbCMC95ymHXWHKZxIMeDMi+YzW3s8kaSBdHI/9wNpLf/WGxq9
         YVN/elg3bzWMlbVx0gATvoe6aPyUdeh2YQyvpa17XLFf1JiA9Bc9AlqDfHV4Om3W+C/M
         M32K581+ABZvSWfCO9RrNa/UKUUuM+0g/WLkBRb83rt4G9/Flus05vnsTNnYjCnxncv/
         7a3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795741846; x=1796346646;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HZ2sCqXwwWM570Uzj7/jKB0ciamWJ56LEpgiUf6Er7s=;
        b=DFWcdF4kwCwHSNZSHG5WVDMWpeEFomc/LZ05ukGmcMD9g0hDWRfW45yoL14OrbsW8K
         NZIIitzpiOUfSoI12Kp1sdOG6sxIXdw7MAwplx+sA1ZG+8ZgxCqjUUlg6tqkLBgD9AMv
         uXBkuhRp7X35rBVQFCzNTvZsf+f9UFFnbnA8rbUT7kKzXoiGKomYBp+pF+7GeRAh2mLs
         5Vqu/9KYp8r1t40OYhfUMoIttosKoxQ3kcrZstuTohcgGoq3WuJRmHFvLg0c7WEpL9dC
         v6pm9mLzvuyGmM+vijePC8/WRiEJXX1wG98myREgWpfwB2A/iHQ8OPIWmme1IED7I0Iu
         LjeA==
X-Forwarded-Encrypted: i=1; AL+hErHlHIlAv5dZ+0LbOt/jrXMp3B2fE+U84KhxmrG0z5hUCBlUBQqD2bKQaDr2NkL0zYOhI8uMX2Yg/SolD9IVig==@lists.infradead.org
X-Gm-Message-State: APuU4Z/8NzA0v8aLIqMnLUYdlXeZbxyk1oNQqWl3+xfwjsUyow6CrbkC
	X9J5Hqz+a8SGTJcShHI7ps13QOD5kDOKBuTCKj0SBNFeVFqYNkghVgFQhlFQ8aX1A2XTtF30
X-Gm-Gg: AZFdTZcE7EdrYw5ijgLt+9szXb5weMsAsycvZh6vVUB4TzXKSOvWvTQ+puvbqrB3peV
	eaSVAjXNq14g3fMkyZXSYATm1Y5ki5gLicXc4qkPImNNJppeKcbp4AnkHc9ejxOL2Am5zBxEX6d
	hLP5ZekgzyEY3ibazKn9FgB6OGVmwMVSirs67bHaI8AO6sEk6zQkro2b2GKcT3cAWz8jbH6d8LD
	dlRH+n1QPkTtbL1+N6WHz6Qovn76KB81Vd7ehY3IadR8/novlaRWvc2bfHwWhsGxBEwCil75/9Z
	KRMe26WNiU1thyu26Nz0kxDQdVDXCcmclEh9J5OPvSgBEtrOa+wSY1cJg77ke/cwuYukQJuaJNW
	Lrp4wPXtwfEgrbEps+5RO4/RySlUEQFiTcl0xrBtWx4GJnQGbHzaOrNKG7DrwGhBlUuHbI2RtCs
	HT6gI1XlXo7jhWQRWyzzWRJbjLpxA+YkFcuHx8lMRERXHk39rBxzRiRjdsZuo/JjTDpoUy2FbAh
	IRLcaqalDsIW+RG9lFEuc4iOjNYT0CZsyAKH050NcD8rAjhwjt9TUG01IqPDHn+WkU5X5928ZuH
	kwWC89ai1Afvb3iI1cmNni14DcbLyrIiP9t8/Jx1Qo/HKWL8aN4fLnn+gfzYgP+ilzGJcPUlr4A
	9
X-Received: by 2002:a17:903:19e7:b0:2e9:9a19:c54 with SMTP id d9443c01a7336-2f03f24206fmr190172495ad.50.1795741846137;
        Thu, 26 Nov 2026 17:10:46 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1207f1sm110189725ad.64.2026.11.26.17.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:10:45 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Peter Wang <peter.wang@mediatek.com>
Cc: stanley.chu@mediatek.com, martin.petersen@oracle.com,
 James.Bottomley@HansenPartnership.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, louisalexis.eyraud@collabora.com,
 linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] scsi: ufs: mediatek: allow clock scaling when
 ufs_fde is absent
In-Reply-To: <7b7d94ab4283b82aec13eae3f9c1d2e77873d88f.camel@mediatek.com>
References: <20261126031008.27506-1-iasnezhkov@gmail.com>
 <20261126031008.27506-3-iasnezhkov@gmail.com>
 <7b7d94ab4283b82aec13eae3f9c1d2e77873d88f.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 09:10:41 +0800
Message-ID: <179574184161.52486.4990124402659702610@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_171047_931114_C549183A 
X-CRM114-Status: UNSURE (   4.87  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 2.2 (++)
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
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,CTE_8BIT_MISMATCH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Hi Peter,

No — this patch does not change whether UFSHCD_CAP_CLK_SCALING is
enabled.

ufs_mtk_is_clk_scale_ready() only checks ufs_sel, ufs_sel_max_src, and
ufs_sel_min_src, so on any platform (including MT6789) whose DT
provides those three clocks, UFSHCD_CAP_CLK_SCALING is already enabled
today and devfreq already runs. Platforms that omit ufs_sel_{min,max}_src
still have UFSHCD_CAP_CLK_SCALING cleared as before.

What was broken without this patch is that when a DT provides ufs_sel
and its min/max sources without ufs_fde, _ufs_mtk_clk_scale() returned
early on `!fde_clki`, so ufs_sel never actually switched parents while
ufshcd still treated the scaling transition as successful and updated
clki->curr_freq.

With this change, MT6789's already-enabled clock scaling actually
switches ufs_sel between 26 MHz (tck_26m_mx9) and 192 MHz (msdcpll_d2)
as intended.

Best regards,
Ilia

