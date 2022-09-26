Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD8BC6FA83
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 13:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDu9apQ4vCKFJKy0P2xDjRbN9HRDAJz/40nJjG+tt3E=; b=1EBBrOR1KA/veiY72iSxKnpLsb
	2oGbPcm8oN2JAy2nJl1rvExTCCEJbiqVQHkhSuXDEwfQGzGIUn/rtvBUeOBQvsFu6Jf1mun+lje4m
	RxbKBPHkhWdwNFg0jFnEO7a55rk4XGYIWpyAT8QN7mOk3wTTuKW7Nk0ibzBQZ/TQjit9ta5HkO5fi
	XTs6YEJYTn4WaKa45EmQWMj5ks11X/Vj+vR1bEzQONc6q+7ddiIQYmtBrBETb+LzlOEGkjZGxIum1
	9QtHvUd2GmOdcNNa0+SzKn25J9fkU6tBFG/YZ4h0/K0v0Zb0iTGQ2hNFa46p6615MwaSNl5AhEj9R
	4da1rOpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocoUr-005DT0-In; Mon, 26 Sep 2022 13:50:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocoUf-005DQH-EH; Mon, 26 Sep 2022 13:50:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F19BCB8068A;
	Mon, 26 Sep 2022 13:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0A8C433C1;
	Mon, 26 Sep 2022 13:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664200191;
	bh=8cBSY/c98zhLzt9mBybVF6c7J50QLah1jmN2uLzVuJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ABQmkoWDYpQtHx3IK4N83Qx41nJzfsuDrVPsjLsj4crqZjSNEsMfU0ndG58BDZACH
	 S28U4rnLKBvykxPqtYv8qQ6q3KtBvl3fGXaKTJ6cP5X2uYJv6jV2c/B8NjczMr+Mw2
	 /qJpUrbm0EWnYJ9PFw094OityW0gFeS8Lriv67nHEgjBEzojxoyq7TZHpBGajtpRDt
	 R1Bj3NRKjg0Oi46GJg5yJpur4uBBcPQgBuC92FTfIl5VKt63jOhTNu9oI6ITGv+uMm
	 Y3xhs4GzdSUz+mQ3sQ4502NO+2W9hUTU+jAVQrm5xMS8i6n1COCT4MW9vLz9KQLFWz
	 UMEwlkTghHeLA==
Date: Mon, 26 Sep 2022 19:19:42 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Asutosh Das <quic_asutoshd@quicinc.com>
Cc: quic_nguyenb@quicinc.com, quic_xiaosenh@quicinc.com,
	quic_cang@quicinc.com, quic_nitirawa@quicinc.com,
	quic_rampraka@quicinc.com, quic_richardp@quicinc.com,
	stanley.chu@mediatek.com, adrian.hunter@intel.com,
	bvanassche@acm.org, avri.altman@wdc.com, beanhuo@micron.com,
	martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v1 00/16] Add Multi Circular Queue Support
Message-ID: <20220926134942.GB101994@thinkpad>
References: <cover.1663894792.git.quic_asutoshd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1663894792.git.quic_asutoshd@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_064957_830937_8ADE1B80 
X-CRM114-Status: GOOD (  22.04  )
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

On Thu, Sep 22, 2022 at 06:05:07PM -0700, Asutosh Das wrote:
> 
> UFS Multi-Circular Queue (MCQ) has been added in UFSHCI v4.0 to improve storage performance.
> This patch series is a RFC implementation of this.

This is no more an RFC series. Also, it would be good if you can provide a
summary on how the implementation has been done.

Thanks,
Mani

> 
> This is the initial driver implementation and it has been verified by booting on an emulation
> platform. During testing, all low power modes were disabled and it was in HS-G1 mode.
> 
> Please take a look and let us know your thoughts.
> 
> v1:
> - Split the changes
> - Addressed Bart's comments
> - Addressed Bean's comments
> 
> * RFC versions:
> v2 -> v3:
> - Split the changes based on functionality
> - Addressed queue configuration issues
> - Faster SQE tail pointer increments
> - Addressed comments from Bart and Manivannan
> 
> v1 -> v2:
> - Enabled host_tagset
> - Added queue num configuration support
> - Added one more vops to allow vendor provide the wanted MAC
> - Determine nutrs and can_queue by considering both MAC, bqueuedepth and EXT_IID support
> - Postponed MCQ initialization and scsi_add_host() to async probe
> - Used (EXT_IID, Task Tag) tuple to support up to 4096 tasks (theoretically)
> 
> Asutosh Das (16):
>   ufs: core: Probe for ext_iid support
>   ufs: core: Introduce Multi-circular queue capability
>   ufs: core: Defer adding host to scsi if mcq is supported
>   ufs: core: mcq: Introduce Multi Circular Queue
>   ufs: core: mcq: Configure resource regions
>   ufs: core: mcq: Calculate queue depth
>   ufs: core: mcq: Allocate memory for mcq mode
>   ufs: core: mcq: Configure operation and runtime interface
>   ufs: core: mcq: Use shared tags for MCQ mode
>   ufs: core: Prepare ufshcd_send_command for mcq
>   ufs: core: mcq: Find hardware queue to queue request
>   ufs: core: Prepare for completion in mcq
>   ufs: mcq: Add completion support of a cqe
>   ufs: core: mcq: Add completion support in poll
>   ufs: core: mcq: Enable Multi Circular Queue
>   ufs: qcom-host: Enable multi circular queue capability
> 
>  drivers/ufs/core/Makefile      |   2 +-
>  drivers/ufs/core/ufs-mcq.c     | 511 +++++++++++++++++++++++++++++++++++++++++
>  drivers/ufs/core/ufshcd-priv.h |  84 ++++++-
>  drivers/ufs/core/ufshcd.c      | 322 +++++++++++++++++++++-----
>  drivers/ufs/host/ufs-qcom.c    |  49 ++++
>  drivers/ufs/host/ufs-qcom.h    |   4 +
>  include/ufs/ufs.h              |   6 +
>  include/ufs/ufshcd.h           | 136 +++++++++++
>  include/ufs/ufshci.h           |  63 +++++
>  9 files changed, 1117 insertions(+), 60 deletions(-)
>  create mode 100644 drivers/ufs/core/ufs-mcq.c
> 
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்

