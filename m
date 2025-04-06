Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CD3C36002
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Apr 2025 18:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3W5JbOyIE71HVwKTUQkHyqilZi+aSbwXv3gNCNt8vU=; b=W18lcWuSWfz7RbkbWv3YkNzMme
	uxYhIYxxeQdBW7PQGoaF3EC0jTpH/JFAGH3a8Zn1XH3OUURKcSYKfgsCpwPSoZoGqL6dfYjPErm+7
	PUcmQFfM4Foz8MZpKguNHNsOCrinKY2HZfik1iw1i0pa85SGKkOXalO16VmhO/TkuMZTKMXXxlV4u
	7Rc90Q/GxvMs/cQkqGL+/D1hrbkADsY265HjvWqzN5dkdS8DNCzP+Ev92Nwgq8ZIAv1FL7OaWygX+
	Z0W4ZQEvzi+xOxNSZybQ9DydOPFbzVTVAg1LViBKvQBOXKJvB5tk6ugO9vgghscpKXrTbsQl/2m3H
	lf3TwKRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1Uhl-0000000Fdqd-2mUp;
	Sun, 06 Apr 2025 18:26:49 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1Uet-0000000FdYO-0WVr
	for linux-mediatek@lists.infradead.org;
	Sun, 06 Apr 2025 18:23:53 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-223f4c06e9fso31332875ad.1
        for <linux-mediatek@lists.infradead.org>; Sun, 06 Apr 2025 11:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743963830; x=1744568630; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+3W5JbOyIE71HVwKTUQkHyqilZi+aSbwXv3gNCNt8vU=;
        b=q2UZv46oD5hp4rrerDSHmuLrXOhzWyW70hUvqY1kw2POHQQlLIcN9fX1A3YDjRuOw4
         q9EFd0xhZRGZem4gIVo1bXN0f/zftTKeRLzNn6+qxPtHHQhieXHOJg61iGShoFlugLFO
         5qEOZoRS/Tp2f97wBjqWTMm6+6XTFJopUD6tVRGCSKpNpR1Y5tx0v6Cex+CbQ8ftwHSC
         I25w1vGsREYqJLQXNx5/kG6DiszR5h5t1cz037SYTVYHjQndNXQukj3D1UG+q4BfA3sX
         b8l/5SIyLk1k6+5W/l4Wo7UBtxSW+Mg3YG67wQzj6CSWPZTl4emcBpohoFYQHOkhn/KX
         u2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743963830; x=1744568630;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+3W5JbOyIE71HVwKTUQkHyqilZi+aSbwXv3gNCNt8vU=;
        b=f3GQIlrl1I5q2I6gvIVJp+7Vsb2yqgCvv239qKaK01RErU3wca2FqHyUzhHfHDXno3
         u5yN7LRQbd7YxQIVTFDNlGY+HK8dAPHP33lMAilND6mB0IzeaBrttDbC5KF5vPUJc/th
         Mdncjli6Sxq9ERq949OutzbeNYKxmK3CQerDt0DI48WuJKvPRrRwicw/IIUQZrPrSfqD
         4x6RDPzD1Ts7syYLECnj896GfdLHEqsJamiQVgL6+UsQNSyDtGcXnRAAibXXOOX/oMxv
         LIkkVTb++tmtGlwEqi66mI3+08DDDYYJniFdUO8EEb6GWPA3/TVNk3tFlmIJ3wux37WY
         bUlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXEqq7IgYNzBPd19uaPfBWj/KyQhpGtEOq6uzhrnfd9k2RGl1Wqxm9r31mtZ2f9gaEk/s4gn6BKKGYZwoTdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwO8koUEgyCofM+EbFDBnXnHQFUSH95b304QyEGUsKiLAi8SmW4
	5ihz5kOMrIawRW79F14vevfEt5PpwpnP2n8QowO8aDIpM504xiD5jGMFPWttTA==
X-Gm-Gg: ASbGncsGDFqRYE+yxGgBWyzNPYQHPvsdUWAWi8NaNRmHKqiMysqPLMqvXY8X0SrugkP
	GXTU5Yn5rptDQkxCwT4MSfSKOBep5tOtdBHC7VtmC9AIwNL/i2hFwuCSsl7KNTxvp/D1eMyomI8
	9KQ0x5fR239PqaJiHVaSWBUdNFrirKsDrjJsxARp8dR45gTAQZd9Lqc2ziGIHgT0ixozk1zwHiF
	KY3Jl6tll3Z2Dti7RNPaXEe6zPAnz22ZbTlc+8AGr7Ctv5vajbytZtBgjuXk2MO3YAUUyqtPC/g
	D/NkvSZSdihWYT80DYzB+9lcpY61+iVrVglMDKoi4ysXf9flC4hbltE=
X-Google-Smtp-Source: AGHT+IFdT0XFI03UAIeiotZXeIYigu0aV7BLlfFTU0OW0vocyL0gj4gwxcJDUVb4tfjT4ZP6NIWT6w==
X-Received: by 2002:a17:903:41c7:b0:223:607c:1d99 with SMTP id d9443c01a7336-22a89992b46mr153666815ad.0.1743963829885;
        Sun, 06 Apr 2025 11:23:49 -0700 (PDT)
Received: from thinkpad ([120.60.71.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e161sm65969765ad.171.2025.04.06.11.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 11:23:49 -0700 (PDT)
Date: Sun, 6 Apr 2025 23:53:41 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
Cc: Bart Van Assche <bvanassche@acm.org>, 
	Arthur Simchaev <Arthur.Simchaev@sandisk.com>, "quic_cang@quicinc.com" <quic_cang@quicinc.com>, 
	"quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>, "avri.altman@wdc.com" <avri.altman@wdc.com>, 
	"peter.wang@mediatek.com" <peter.wang@mediatek.com>, "minwoo.im@samsung.com" <minwoo.im@samsung.com>, 
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>, 
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bean Huo <beanhuo@micron.com>, 
	Keoseong Park <keosung.park@samsung.com>, Ziqi Chen <quic_ziqichen@quicinc.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Gwendal Grignou <gwendal@chromium.org>, 
	Eric Biggers <ebiggers@google.com>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v4 1/1] scsi: ufs: core: add device level exception
 support
Message-ID: <ouxmroni4miwrzd24gvcvo3v5hqthodhhx3ohk4i37qryn4k2w@47s2a6nvxby6>
References: <4370b3a3b5a5675bb3e75aaa48a273674c159339.1742526978.git.quic_nguyenb@quicinc.com>
 <SA2PR16MB4251229744D717821D3D8353F4A72@SA2PR16MB4251.namprd16.prod.outlook.com>
 <c5ab13ec-f650-ea10-5cb8-d6a2ddf1e825@quicinc.com>
 <0a68d437-5d6a-42aa-ae4e-6f5d89cfcaf3@acm.org>
 <ad246ef4-7429-63bb-0279-90738736f6e3@quicinc.com>
 <3d7b543c-1165-42e0-8471-25b04c7572ac@acm.org>
 <4cb20c80-9bb0-e147-e3c0-467f4c8828ba@quicinc.com>
 <989e695e-e6a4-4427-9041-e39ecf5b5674@acm.org>
 <yzy7oad77h744vf2bdylkm4fronemjwvrmlstnj6x5lzjxg672@zya6toqv4aeg>
 <1b87152e-ff0f-9c45-020d-4927ff3dbef8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b87152e-ff0f-9c45-020d-4927ff3dbef8@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_112351_187403_7F191DCD 
X-CRM114-Status: GOOD (  19.92  )
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

On Wed, Apr 02, 2025 at 12:00:26PM -0700, Bao D. Nguyen wrote:
> On 4/2/2025 12:49 AM, manivannan.sadhasivam@linaro.org wrote:
> > Yeah, we should be cautious in changing the uAPI header as it can break the
> > userspace applications. Annotating the members that need packed attribute seems
> > like the way forward to me.
> 
> Yes, I realized potential issue when Bart raised a concern.
> 
> > 
> > Though, I'd like to understand which architecture has the alignment constraint
> > in this structure. Only if an architecture requires 8 byte alignment for __be32
> > would be a problem. That too only for osf7 and reserved. But I'm not aware of
> > such architectures in use.
> When using "__u64 value;" in place of osf3-6, I saw the compiler padded 4
> bytes, so __packed was needed for me to get correct __u64 value. I thought
> even the existing structure utp_upiu_query_v4_0 may need __packed on some
> fields where the driver reads the returned data in order to be safe across
> all architectures. However, without evidence of an actual failure, I didn't
> touch the existing structure. Only raised potential issue for discussion.
> 

If you change members to be 64bit, then for sure compiler will add padding to
avoid holes. But I don't see any issue with the unchanged utp_upiu_query_v4_0
structure.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

