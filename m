Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DF6EB64D9
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 23:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kX4KQkS9n4VAC2qSIaAGCx3GNGd1xoIMp65oHXNSsCU=; b=gPeGvJR7b7BVkaj9V3UnPHraU7
	+d6CbFFFHvZUCEhGi7Cq5jluKjuuEk8sA6HZNg2IfjrJzitMQl2gF02nX2cUYt7+NGcIqT0nGWDIN
	o7UXJkBN/KWzouvZMDt1Mo5Km17Ue2WlZsa2M2/r9crZpCq7iwFDwe4oLbZcjRiEOY20Bhn6wNBhS
	DoD2Ekweqs9JEzM/VBCiIv902S3sBpnjvKmXpKU7BXF8s4nIQFh4ZohoxwSvFE85yJeJjilEQj6NK
	WvZ2V17Nvrmfsmop3YeIuW+uEc6iM4h8kuUUDFvPUS0y4OkJ5QEYJhSsFiy6gIlAeH9vOOjfY9qsz
	YSHtb3mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGpPT-00EMjJ-0A;
	Tue, 04 Jul 2023 23:26:15 +0000
Received: from mx2.ucr.edu ([138.23.62.3])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGpPQ-00EMhs-1w
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Jul 2023 23:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1688513173; x=1720049173;
  h=mime-version:from:date:message-id:subject:to;
  bh=IIcGzf0mh9g73nBCtmMFvgNM+Eq+aaBo6WfZ0QBu17E=;
  b=covXLHmWkQKqJl5u6MRHluWprMF5DvNb1TzRv8SIvObh4rkQJjwluIK8
   X6EcVARJo1t9t++fJZlw/CXu4mky2K1o4FPHgQRzJZp1QQUYyARZSK8/e
   fvie1jcBSDGKAxJOsA8LZ13i8d7KO5z/Y2yRdsF4lB4+ptBeJudYdNRUE
   yG78iy1i8O63RA7CFPNqtwwZyRNZOKp5ENSbVhiYwzZ+3xp1sjLu2rLY9
   3Tc21Ei4w2mQf9nHVo1eenjZ1BayxXPp2oyr1elu9UWehLvu9ua44Ocng
   stD2KcLxbTitACt/MdKpU5wiPd1Z1ZDSCICjibTFWOvHk4KiKHgsu92DU
   w==;
Received: from mail-wm1-f72.google.com ([209.85.128.72])
  by smtp2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Jul 2023 16:26:05 -0700
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3fbd8cc134aso17208145e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Jul 2023 16:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucr.edu; s=rmail; t=1688513163; x=1691105163;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kX4KQkS9n4VAC2qSIaAGCx3GNGd1xoIMp65oHXNSsCU=;
        b=Wna9BBKFzEMaCEtvGZB+yT8Jt70cwhNa/5N4yycxRMDqD2SVM3Ig7/UpjLd/B6MuMK
         4tT2DCl14duFCEFfZTC5jKSccqa+xR/c+J1TVxRp5jUH5pPz/01KynduoYnUeD//LQNt
         iyiwyAXPs8bgYMETS85D9W6KeU3LoonWikSlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688513163; x=1691105163;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kX4KQkS9n4VAC2qSIaAGCx3GNGd1xoIMp65oHXNSsCU=;
        b=eAZ0dP8lvc1N9fX9edqvFcLTvZQ8l7ZVQk4Ho77lNUz+7c4jAcxgnqdkvM0l8sx/EV
         MfdfuxC6IjSPRhCWbl0gJ5+QA4VJrCx5GNTxy8PzL/tcWm7iu8iYFJBSE4Mbzm69N3SH
         00SdSPH5Hu9eDN97m5BHHS6Gt1luf6pp0cCMuSB7MsTksnTcwoMvypoQ6aiRk6DFSZyY
         5LSkhsB9JY6X5OC/B5mrrhXyjMckAj0xOTqHx+aH6voh6T8L/GS9MN/LfgYUzWJJDtVU
         hjWhlsqYdCdYr146OQJ1AbHyZ37SjQfa2O4jijRpqeFmn9oNrtrpw/VGCONigjDivFQA
         /mlA==
X-Gm-Message-State: ABy/qLa+HbhHfQ111QoW97pGQwZtTol0erxEF/IhSwJk1rFrHgz6zDED
	AlDL+YSHpRyxYGxvI2r0Wuu7PMPqfV/M9XdBFw3N9fEz2NaFAaDlqFz6V0/lmQ2n526pCp5mv1V
	fPKCM99aMdqZgVhpgc5ExznyGEhPE4mLnirRcLct4/LuDiZj/Dw==
X-Received: by 2002:adf:f6d1:0:b0:313:f7a1:3d92 with SMTP id y17-20020adff6d1000000b00313f7a13d92mr11357205wrp.66.1688513163277;
        Tue, 04 Jul 2023 16:26:03 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGPHNfkxxQrUTgpCNAWDSLPEBOshdPoSSdm8s4Xq/52TYuqpLWxYADoNTOT/rraoqVUff/OQdjCnMkVyzUAnlI=
X-Received: by 2002:adf:f6d1:0:b0:313:f7a1:3d92 with SMTP id
 y17-20020adff6d1000000b00313f7a13d92mr11357195wrp.66.1688513162932; Tue, 04
 Jul 2023 16:26:02 -0700 (PDT)
MIME-Version: 1.0
From: Yu Hao <yhao016@ucr.edu>
Date: Tue, 4 Jul 2023 16:25:50 -0700
Message-ID: <CA+UBctDxfb6+70+hzuXJ-gwb65E0uoNzXYEhpJT92sXr2CE7OA@mail.gmail.com>
Subject: [PATCH] usb: mtu3: Fix possible use-before-initialization bug
To: chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_162612_664268_F27EFCD2 
X-CRM114-Status: GOOD (  11.87  )
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

The struct usb_ctrlrequest setup should be initialized in the function
ep0_read_setup(mtu, &setup). However, inside that function,
the variable count could be 0 and the struct usb_ctrlrequest setup
is not initialized. But there is a read for setup.bRequestType.

Signed-off-by: Yu Hao <yhao016@ucr.edu>
---
 drivers/usb/mtu3/mtu3_gadget_ep0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c
b/drivers/usb/mtu3/mtu3_gadget_ep0.c
index e4fd1bb14a55..67034fa515d0 100644
--- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
+++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
@@ -638,7 +638,7 @@ static int ep0_handle_setup(struct mtu3 *mtu)
 __releases(mtu->lock)
 __acquires(mtu->lock)
 {
-   struct usb_ctrlrequest setup;
+   struct usb_ctrlrequest setup = {};
    struct mtu3_request *mreq;
    int handled = 0;

-- 
2.34.1

