Return-Path: <SRS0=DXFh=PU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3D5C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 03:33:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76C2A60F0F
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 03:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76C2A60F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YyKVid0rVbt/l3t27aufWJEJg0TqRgPPTGRfkrqsiZ4=; b=vkNHVxnTTW793O
	G0yqZRNsCryuMNatRov699WAERUDZvEi3jHU1BMhJmm7c6CG8ozBmpYxW2on8bwIA0LKwNpuXQUjt
	odmi0Z8DVqEs2M9pMl2LN5vcEcRZsFZPYIdcWfOLs6SsLtZDiTfj7x7768+gYatbt+m9W5URsZPPj
	KIJRtsvy9HXioKUUHgrKRUnr8mOOdC2ELlq+9ai2bq4H89YKalRsTUsxqwb3GsiTG1Ju/MuBwxJ/6
	ISIKlqtB18xOV7ZmpmQe5TOQIvU4QpaRrh2LFAwk2c5R8MFsCYBerMAP8w1T1UnKVxWO28Zcqjl05
	4xDOVFsZHOZmxpTUIhZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhO4p-00FBDv-P0; Mon, 01 Nov 2021 03:33:39 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhO4d-00FBAv-0s; Mon, 01 Nov 2021 03:33:28 +0000
Received: by mail-pf1-x436.google.com with SMTP id g11so3725313pfv.7;
 Sun, 31 Oct 2021 20:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:to:cc:references:subject
 :content-language:from:in-reply-to:content-transfer-encoding;
 bh=sharXBBWNJQME5ykY3LH+Wuf67MVUTp15Nj0dIthtu4=;
 b=YNKZPhGxufB1MqdoLMpX2GgiBUoek9Je1+IUYEEe+W4RTQ8dKyjs4HuwkJDE7WItU8
 5QLRMEeeJeH93IAEB7FtpD189DdiqLNtLPZAPIJ6s3l+Q0Rfoe+gWBbkYk8Y5ik2kbPx
 vvyC0IhJcKsDZ1NviSWRTTT20o3MBTlqL12HK97h5FLU6FALN1bmMp84dyrOxwUWvPm8
 Bj2epbaPGN0MvVij0J8ZR79dAqcCEiLSzkPvXz7DcInYAl4IepwXKJ79Gqur4ScbDShR
 CwUutsvEfXZu9KUyzx7n0eRtUbsR3TnVd/veVNIoq5YArKI8wKpqZJ+ySxlXMVmu7rSu
 jvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
 :references:subject:content-language:from:in-reply-to
 :content-transfer-encoding;
 bh=sharXBBWNJQME5ykY3LH+Wuf67MVUTp15Nj0dIthtu4=;
 b=AwV4UZJmQKIj4mXo/q8rHZa3lQl45+1jqXzqFXCerBI7uyc29/NfqApoEWXrWvCZGr
 SAREet6+nC7R9vS/xlKYymOglgwTTKH8RnyhCXWmBzVQAUABF211yyvbXAtYKibdV95x
 fLjuUavZrDX+gpdbRB7DbUU9YxNOnDcOJrpdhAKzFMkxP01KSlNS0qnTPu03ZeWUYIyL
 7R+LN3mNzZKoUs/4po9FxpzGvhxHg2WH8caL2RoRyofpTfSz0bvz+t45po0KKDkCGDnS
 T3tWn4HUpVaPM/qqaH2Vd+qxIaiKF9zvoN9o5sx1km3YYTO+qc/9bvZtUi5F3McFEIbh
 BQ7Q==
X-Gm-Message-State: AOAM530YxoZNktddv8+sCOezO+7z3sTWHv22SGyCg/or/MsaXQ+vN8fR
 WTmkkZZ7BlEwXtZEkg7U8ec=
X-Google-Smtp-Source: ABdhPJyMvgiysaFFd7vJTxWh3eDoFfSzoDu6orq/3c+qmlVO4XLL+lpJqF+q+5V6CjZ2MHarSBDLDQ==
X-Received: by 2002:a05:6a00:22cb:b0:47e:5755:7d86 with SMTP id
 f11-20020a056a0022cb00b0047e57557d86mr23342419pfj.78.1635737603550; 
 Sun, 31 Oct 2021 20:33:23 -0700 (PDT)
Received: from [192.168.50.189] (67.218.130.61.16clouds.com. [67.218.130.61])
 by smtp.gmail.com with ESMTPSA id
 h11sm15364884pfh.162.2021.10.31.20.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Oct 2021 20:33:23 -0700 (PDT)
Message-ID: <c639c965-5231-b745-7b59-476877202e0c@gmail.com>
Date: Mon, 1 Nov 2021 11:33:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
To: chunfeng.yun@mediatek.com
Cc: eddie.hung@mediatek.com, gregkh@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org,
 matthias.bgg@gmail.com, nishadkamdar@gmail.com, stern@rowland.harvard.edu
References: <1618017645-12259-1-git-send-email-chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2] usb: core: reduce power-on-good delay time of root hub
Content-Language: en-US
From: "Walt Jr. Brake" <mr.yming81@gmail.com>
In-Reply-To: <1618017645-12259-1-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211031_203327_107883_0E765BEE 
X-CRM114-Status: UNSURE (   7.40  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Three month ago, My USB 3.1 device cannot be detected after upgrade 
kernel from version 5.10.41 to 5.10.42.

And I found some other people ran into the same issue:

https://forum.manjaro.org/t/kernel-5-10-59-doesnt-detect-a-connected-usb-external-disk/79320

https://forum.manjaro.org/t/how-to-make-active-usb-hub-work-in-manjaro/84548

Two days ago, I try to fix the issue myself, and I found out that it was 
cause by this patch. After revert this patch, my USB 3.1 device can be 
detect again.

I have already file a bug on here: 
https://bugzilla.kernel.org/show_bug.cgi?id=214875.



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
