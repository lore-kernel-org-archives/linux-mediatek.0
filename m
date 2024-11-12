Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64F0D32D7E
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2024 09:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=upVCqRU5o9VJXCHj9o5z/en4Y7HobD9kfp6MRO5BLes=; b=jPN16j58vWp5FDBcqbc1Wp3mxu
	K3fg1RpibqqzjSfRDFC35e7ODL/Sy7mqUUpRaeA5kZvW+5hTKzAyLdwzItYJjrmmwE64T/5jjWt3b
	WbNBKENZs04QzDCd5cu2Ry2OFseKNzy9io8jE5VL2w4tYQq7nQ2hHNbGaiBXErxLXVzFAfuLai8df
	Hd9/FPlNi2TPkjtfnVQAEA0erZGYQ9kCfMhdCJvoxzzgqfNdlKrEF1vrEVgyVadXnh/F3vSkBmsmo
	/HddQ5WsnnRw1koEBSMCcWaaXeBHURxRLpGrQcQGK/3y5Qh2ZXaeXsmcv+FN/HsSLztbvzFhzSwNQ
	4XsINEfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnJN-00000002tQY-1L8I;
	Tue, 12 Nov 2024 09:35:49 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnCs-00000002p0H-1F4y
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Nov 2024 09:29:07 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5c9388a00cfso6901541a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Nov 2024 01:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731403744; x=1732008544; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=upVCqRU5o9VJXCHj9o5z/en4Y7HobD9kfp6MRO5BLes=;
        b=L0oQQ3sXPFc++PubUp4fXxc6rKipDHTmgBBwI52BgeZVgQ8gn6MoYwpL8nz0/GOPQA
         lRF/lYWOn+TjOk6RoBU5fHRCEnKSL7z8TPH0rpJ7vQpI9SgSTxQ43CFpuxrHg5NrFqPC
         b7KmVEfZM6NIrerBT8CXpxP4Sm+ALpjx50iY3ZP6aWqmVoxtYNVXCii+W/uIPFlrf6lu
         O/cxLoa+tcWeNLkEvUZD5JTHDYw/2Bmqc0vdww4esVr59v/hE24fl28op58F+uAqL989
         wsXpsmVyl2dXQUaVdutZJphJ4ZCINwUfk3WUeQ7bKPdesDA5LqqjeMkn/pu/muUXvU+/
         /cTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731403744; x=1732008544;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=upVCqRU5o9VJXCHj9o5z/en4Y7HobD9kfp6MRO5BLes=;
        b=Focg7A9yTaziFWFNFp2OxPqK4onwWHhIEN2JnwQV8fBE+E1nKUqvCOUd/5gEOuBf7J
         gzHis8SofJ5BXnzgXeSBxHTSBfOI80/MbLW014OqjYcJnIGYzjTOHQMHX+3HrW504HU2
         lwbweCJa5PSnXFVaneJjpuQGOQqds0waDvvlPpSoPlLJwgkxwryKt9n0oMKH7ZYdUxTS
         nmq7Xf//A23e5DVGCpQlsSlPjo9GFwPfRku1gg+E2tWxmUgGkuOM4BzMsOvnrTbudXEq
         xMTA8biw3XTdmXxJGwo2yelVprTHsw78sPzGaT4uprHZSC4iBFYK/oI3GCfz0bIMO3bW
         cpzA==
X-Forwarded-Encrypted: i=1; AJvYcCWwjYwZG9SkXMhCY9TqCvvj6rWULs+f3QIjk+eFpwPIWDMHRRI3NGb/qoaEoXhDEY96WyNvi/MxGHv5jbt4Lw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqFO9NQBrLruxe/IUrel9t/Elp6QfutvzBt9HIdpg0CVclbqWo
	unfkfJT07LKrYrP5OncIzE1595UleK9s5wJ0p6EFbwkAbIBW1K18gdvdeUuoY6c=
X-Google-Smtp-Source: AGHT+IGxwNn2QLEYLJ5/mxammi4su9l/ZXKYkLron+OnhMVz+hw5afB6jPFE4I5g19PmmwZVKpoEdw==
X-Received: by 2002:a17:907:3f97:b0:a9a:5b4:b19e with SMTP id a640c23a62f3a-a9eeff44646mr1549568066b.32.1731403744042;
        Tue, 12 Nov 2024 01:29:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a48b1fsm693743066b.58.2024.11.12.01.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 01:29:03 -0800 (PST)
Date: Tue, 12 Nov 2024 12:29:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Subject: [bug report] drm/mediatek: Implement OF graphs support for display
 paths
Message-ID: <633f3c6d-d09f-447c-95f1-dfb4114c50e6@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_012906_380589_8ED54F2F 
X-CRM114-Status: UNSURE (   6.14  )
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

Hello AngeloGioacchino Del Regno,

Commit 4c932840db1d ("drm/mediatek: Implement OF graphs support for
display paths") from Oct 17, 2024 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpu/drm/mediatek/mtk_drm_drv.c:913 mtk_drm_of_ddp_path_build_one()
	error: uninitialized symbol 'next'.

drivers/gpu/drm/mediatek/mtk_drm_drv.c
    899 static int mtk_drm_of_ddp_path_build_one(struct device *dev, enum mtk_crtc_path cpath,
    900                                          const unsigned int **out_path,
    901                                          unsigned int *out_path_len)
    902 {
    903         struct device_node *next, *prev, *vdo = dev->parent->of_node;
    904         unsigned int temp_path[DDP_COMPONENT_DRM_ID_MAX] = { 0 };
    905         unsigned int *final_ddp_path;
    906         unsigned short int idx = 0;
    907         bool ovl_adaptor_comp_added = false;
    908         int ret;
    909 
    910         /* Get the first entry for the temp_path array */
    911         ret = mtk_drm_of_get_ddp_ep_cid(vdo, 0, cpath, &next, &temp_path[idx]);
    912         if (ret) {
--> 913                 if (next && temp_path[idx] == DDP_COMPONENT_DRM_OVL_ADAPTOR) {
                            ^^^^
The first two error paths in mtk_drm_of_get_ddp_ep_cid() don't initialize "next"

    914                         dev_dbg(dev, "Adding OVL Adaptor for %pOF\n", next);
    915                         ovl_adaptor_comp_added = true;
    916                 } else {
    917                         if (next)
    918                                 dev_err(dev, "Invalid component %pOF\n", next);
    919                         else
    920                                 dev_err(dev, "Cannot find first endpoint for path %d\n", cpath);
    921 
    922                         return ret;
    923                 }
    924         }
    925         idx++;
    926 

regards,
dan carpenter

