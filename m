Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18D3C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 08:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mCkw4TDwBetCmDSRwlScZAUUK7uBbqNPLK55lE4n1Nw=; b=GT4u15oiS3mxcm
	mUkiL8apgDD7bSdIBdK6gvXiuLJ1YRNQjCw7A5wwOunA7ZcGS/Y6mDiiXFxQziYcxen5EGyiTWowJ
	qO2X3jwoSvSot6tmmRNw7LlkER4hqDsYF+kG1pjXCSfbZ6TjPxEUl6rZ87sWwDYXqYqqm2q/3NpxJ
	Vqz16RfiEOK/Zmw5W0zQEQMVja/D/+kaGQixXtiKxqgGAULNaE2/e1ZzOJpgbTCq4AxgPXHJAAem2
	n9n5Y8BlZzmaB/QvHilEFpT0NcQZQps105Mj7u/p1/R/7ratrIxBPVGcLZxGGZEry+AS96S6UOxSA
	b8GYd7aNjEmj/87JDdFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPgzF-005myU-ER; Thu, 03 Mar 2022 08:39:01 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPgzC-005mwU-96; Thu, 03 Mar 2022 08:38:59 +0000
Received: by mail-pf1-x42b.google.com with SMTP id j1so196985pfj.5;
 Thu, 03 Mar 2022 00:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SGMF6oSM44wO/3sji0yXCG/PEtOPShxdSQ68WLQRB2g=;
 b=ZvINIOlHF3nZHDcX3MwxAzlzprOUAV7bE6ys/MgPVlfVq9lkuahVjDHsPLQ7QbaFo9
 fQEFqUdMgi81YiKV62ulZnN7ZvbWazV6yRB1Qn/XiuQndMVO9fvHUymuPfTr2Dg+jh50
 vUEnvjC71yyLrdhZGmiVJ4PzTrzLKfXKpEMH9pkW4eVCRVAqTfa9XuvSN7zcx65Vy8CK
 d46NAYhkVq2HOhizng3Ws+JRbkWyYjQl4vq/u0RRAuHhPVUlG5PBN7oH7sIbE0gusQ26
 6C+XTV9PxP4Ds6jAKJQCAmbFUS0yNAc3zTUs7Z/QKxXKC+XQ8KtJ4GqninQZxzg5r19Q
 dsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SGMF6oSM44wO/3sji0yXCG/PEtOPShxdSQ68WLQRB2g=;
 b=z9cCFB8XSEpJPicX0u+fW3i9Y+IurgICkLFptmL0WrV2ZU2dUM1ikJyAoQHOcG3ExI
 cBPMxzhUr7iwz0LS5nCKygN7Yls+txfODpFA8JARGNyoRu08NaAyfjxP7Qu0cWn6zerA
 Ulwcju8tlI05HXjKgTRry/aJnzitlA8kwFpz1lJCrVv9XmVWgto6KHhbkxjNEnikY5H3
 nKgKDV70P1Iun+ApN8b0fVCLQdDp96pmacFWz2xEVkjMZuCBOcF8nDYjWA0vYz0mSYtT
 k57tCvdeBQY431WqHCzANzcX4i87ecbqfy1m9qtma/K8EP3c6+V1KFDZM0pOq0slfGFl
 PQuw==
X-Gm-Message-State: AOAM530FpGoZpSrjnVA9qX2B+0iAczrEWWEDaU7G9k/QZ1YDERdHXmDZ
 IIex7hZYYKOxCEnQMraUhwU=
X-Google-Smtp-Source: ABdhPJxqu7M+1zWgFCPBx1x396RDv729JpxnE5pMePfUDpYTg5HqtDHmeV1ToBxB32C6BUNb5VRxjw==
X-Received: by 2002:a63:f03:0:b0:374:50b5:1432 with SMTP id
 e3-20020a630f03000000b0037450b51432mr28638188pgl.308.1646296735582; 
 Thu, 03 Mar 2022 00:38:55 -0800 (PST)
Received: from ubuntu.huawei.com ([119.3.119.19])
 by smtp.googlemail.com with ESMTPSA id
 q92-20020a17090a1b6500b001bc169e26aasm6405436pjq.2.2022.03.03.00.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 00:38:54 -0800 (PST)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: xiam0nd.tong@gmail.com
Cc: David.Laight@ACULAB.COM, akpm@linux-foundation.org,
 alsa-devel@alsa-project.org, amd-gfx@lists.freedesktop.org,
 andriy.shevchenko@linux.intel.com, arnd@arndb.de,
 bcm-kernel-feedback-list@broadcom.com, bjohannesmeyer@gmail.com,
 c.giuffrida@vu.nl, christian.koenig@amd.com, christophe.jaillet@wanadoo.fr,
 dan.carpenter@oracle.com, dmaengine@vger.kernel.org,
 drbd-dev@lists.linbit.com, dri-devel@lists.freedesktop.org,
 gustavo@embeddedor.com, h.j.bos@vu.nl, intel-gfx@lists.freedesktop.org,
 intel-wired-lan@lists.osuosl.org, jakobkoschel@gmail.com, jgg@ziepe.ca,
 keescook@chromium.org, kgdb-bugreport@lists.sourceforge.net,
 kvm@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-block@vger.kernel.org, linux-cifs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-sgx@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
 linux@rasmusvillemoes.dk, linuxppc-dev@lists.ozlabs.org, nathan@kernel.org,
 netdev@vger.kernel.org, nouveau@lists.freedesktop.org, rppt@kernel.org,
 samba-technical@lists.samba.org, tglx@linutronix.de,
 tipc-discussion@lists.sourceforge.net, torvalds@linux-foundation.org,
 v9fs-developer@lists.sourceforge.net
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Date: Thu,  3 Mar 2022 16:38:31 +0800
Message-Id: <20220303083831.11833-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303083007.11640-1-xiam0nd.tong@gmail.com>
References: <20220303083007.11640-1-xiam0nd.tong@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_003858_330072_CDBFEEB6 
X-CRM114-Status: UNSURE (   4.95  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

correct for typo:

-for (struct list_head *list = head->next, cond = (struct list_head *)-1; cond == (struct list_head *)-1; cond = NULL) \
+for (struct list_head *list = head->next, *cond = (struct list_head *)-1; cond == (struct list_head *)-1; cond = NULL) \

--
Xiaomeng Tong

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
