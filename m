Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB7D6C00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 14:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0UzXuhE6yJcwl87VMTObzQUfGKkJDSW5LnrMp+jbqhs=; b=QPLh3OVc+pdDjXqcJ03mlOI0w3
	PgI8k1PeO7hI/wP/+tu6T7GRUMIfq22HbRGdvQg2txWKnyETTq1wq2czSf0qQdfwsNX5hwsnAAAd6
	g+ssWjNlwWdyBsXtkfiAqTe/1qw4qbAs+K7FlhE+i/6jRa+E225/dDszBcApbk7Bb+wrmq/SPUYC5
	5jaG89RP3mayijzSiGdxYFkXOVAbezcNo7ecVRuz1wJg+71/DZhZsGCMLHcd6x0qeu1yuvxbXPM1Y
	Mj2cry9OCLzvdW36fH9BS7IasgKAh1z/iNyde7X10B/C5ncMxFbtOAtxAQ1Ppg0Lz7W/KEy9KZdqH
	COxnve8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIsWW-00Em4V-8p; Tue, 02 Aug 2022 14:05:28 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIsTS-00EkN0-BW
	for linux-mediatek@lists.infradead.org; Tue, 02 Aug 2022 14:02:20 +0000
Received: by mail-lf1-x12a.google.com with SMTP id t1so22069884lft.8
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Aug 2022 07:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=0UzXuhE6yJcwl87VMTObzQUfGKkJDSW5LnrMp+jbqhs=;
        b=Y4dHHvintKOmRVO2Ms2dA0ZqYrdCW9AvjR0/yNnXIS+sSWBfDv5V3Ck2AUg2AyYLj3
         g9cxGOatvUFNKf7jOx6wWXNXSnE8EJpvSNPAx5MASiS8qtaEmUbelabEZlfFBUbqH31v
         /8n1zvu8ORV1ywV9LZ1kwhoW2EK6tEGO9tGYphVeFjbm1p6NUniuOx7WNu43AoxzIyV9
         MdxYkPnN3VIy6zMv/SgVDeBV84peCOpGRnNu1cRVmup1R+Xz8e7HVL1acOWw4tv0sz4g
         H+OkMKVNCrwQGWRrEVoTTW0622hNPqTH+rYHTB0gqhuKam4I4M0RM+ncBZUCE+m7wIqB
         6fAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=0UzXuhE6yJcwl87VMTObzQUfGKkJDSW5LnrMp+jbqhs=;
        b=X9F1ku6Olv9g6HNWUKdIAQoJ61JAr+8u1Su6vFuEwvk2pUlO1Bdk60fLOWv1ut+Bfy
         dIaRBikGxCnwHijMAarB+trYyc8GcLpAS2lPUqPP3DxGQyZeh2knuJUA4joJth7gY/kb
         KVca6uz1oVOi9a5m+AHy1QydQrX8HNzc7qUV6WxubDYL7OweGRUrCuPJ3dPLMT9FmAy6
         Zyudaqn1kxo0ZCio8CdDFJnw4vxiDKWyUDTFLl+d1hAUO7lGCxYY49cCOwPz0w0MGS5U
         pPyUoJxsRDFNz3uZQEYV5kKbtFe4+xkdNcmBgiMiQDvMmjWg/cy/+FV2ANJViBr+zevc
         3LFg==
X-Gm-Message-State: AJIora9KzZGVABcobvPfphe9ZQFzs+n7Wm5RjNjbTMCuNxpS99+omGNe
	bFWz0bVeEDaWw6LwxMXjs2i/R10EnnDj3ZDaBMyaGP7wcg==
X-Google-Smtp-Source: AGRyM1ux1TT8aEvnhCvivua72XsQNagFqcnYuzYOVKOhiawf4AJLoxYkrXXFPqq6a221cDDRGzWuvKcefgs6rPMZbKI=
X-Received: by 2002:a05:6512:1694:b0:48a:9d45:763f with SMTP id
 bu20-20020a056512169400b0048a9d45763fmr7213036lfb.662.1659448933851; Tue, 02
 Aug 2022 07:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220802132414.32607-1-peter.wang@mediatek.com>
In-Reply-To: <20220802132414.32607-1-peter.wang@mediatek.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Tue, 2 Aug 2022 22:02:02 +0800
Message-ID: <CAGaU9a96uHTqaG_9n0jUVDuqfyzmD_hQE_h_n4rbUuS_u-6tUg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ufs: allow host driver disable wb toggle druing
 clock scaling
To: peter.wang@mediatek.com
Cc: stanley.chu@mediatek.com, linux-scsi@vger.kernel.org, 
	martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, 
	jejb@linux.ibm.com, wsd_upstream@mediatek.com, 
	linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com, 
	alice.chao@mediatek.com, cc.chou@mediatek.com, chaotian.jing@mediatek.com, 
	jiajie.hao@mediatek.com, powen.kao@mediatek.com, qilin.tan@mediatek.com, 
	lin.gui@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_070218_447616_6580F326 
X-CRM114-Status: GOOD (  12.62  )
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

Hi Peter,

On Tue, Aug 2, 2022 at 9:25 PM <peter.wang@mediatek.com> wrote:
>
> From: Peter Wang <peter.wang@mediatek.com>
>
> Mediatek ufs do not want to toggle write booster during clock scaling.
> This patch set allow host driver disable wb toggle during clock scaling.
>
> Peter Wang (2):
>   ufs: core: introduce a choice of wb toggle during clock scaling
>   ufs: host: support wb toggle with clock scaling
>
>  drivers/ufs/core/ufs-sysfs.c | 3 ++-
>  drivers/ufs/core/ufshcd.c    | 8 +++++---
>  drivers/ufs/host/ufs-qcom.c  | 2 +-
>  include/ufs/ufshcd.h         | 7 +++++++
>  4 files changed, 15 insertions(+), 5 deletions(-)
>
> --
> 2.18.0
>
Except for some typos in the commit messages, otherwise this series
looks good to me.

Please feel free to add
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

