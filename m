Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E3EC83017
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 21:10:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0161C2075A
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 21:10:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cFpUW7Uo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AWR/7M4m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0161C2075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sfcV2EkhuZHzJ78+fBa/AnW+IdtqJh9NtPsn7lrVLss=; b=cFpUW7UoC5je1og2IqfNCSVIM
	tldmwGnJOmY1q1dHcl6JiHlcGLoxzjkbafsDRcR5k7ubS5iDQdKMG1ZsLezp8F/2vtkLPyaw/GjJI
	vNhI41CoOF3K3Vcl8uzsm4Q+K4NLiFwmlxcj+dk0Tayk0EWH+7wphbJHmmRAQQMqt7HaDF0wbFEM+
	SA/Plx2DnUUrnPyHNT3O2hZoIhuQINBEz/LLbA4mvhkvaxRvJcTQS7+bWKwT9cvx+eBZbCfkxo7zZ
	6dBy4UD6AornRu2N43bv+n1S8JNxbZXLdtWmk1PXrqn7G6hnl9hFWDYN19y2auaShBBjJ1COxbtvJ
	hV8/waURg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki23I-0007ds-5V; Wed, 25 Nov 2020 21:10:12 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki23C-0007Zs-0O
 for linux-mediatek@lists.infradead.org; Wed, 25 Nov 2020 21:10:08 +0000
Received: by mail-pg1-x544.google.com with SMTP id s63so3494824pgc.8
 for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2020 13:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5kDOOuMOjwqEdI4fOY8lF/zJwxoesF7EbkKd66qXZt4=;
 b=AWR/7M4mhE4fi43nRvdimsQoF0WR0/yRvzcmpbbdNnukQZ4s3FUnDOA4HlPrcfy1KL
 TnDV3Sp7ib0l66wO1u9Qkihqc0ymqk7uAD73hLx1Hbj+4zgGkd46Av0r6N17g4aWHL9f
 T52peLS6H3gWn2HtVm1n8SJNqsSbmk3lehF9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5kDOOuMOjwqEdI4fOY8lF/zJwxoesF7EbkKd66qXZt4=;
 b=ZD4amuI+NItK9tLtjy/PkbelixV++U6fGZfZsOq3YZ08fiaycuS3yiF+J85qPXfDOE
 oJCRkevCCUdM9iy265s5GD27En58lbDNvjWUUSa8Vvt6pFAj3EWL1jbIEXQ8enjXB7F6
 D3q70D5lRyOX5StgZbWq/uMNPnvZz235MNpSprBaSNvm19tYdXhBr33RkiqCAkoMjmCu
 WvHbhMpOK11Kld0zMtq39JgcSrqffNEl5rKt9AvnV7htwuE/JiZzQGJdMEhehqsQDfYk
 ZkySzR6T+7PgzbWNVvr9q/5O0OiNlrlfSeHbTOeoLykQTzyLA6eL711hgPhpmS3zh4Gy
 B3lg==
X-Gm-Message-State: AOAM530ow20+1wGKjsQULyHoAEsog3HkwMEseoAAHzV1+khHcwOt4neT
 tglLfi1OOItM2+n9l0EqJ5ytWQ==
X-Google-Smtp-Source: ABdhPJxtOU3VPA7Y7ucN799oMICSzuh5uhFKuAq1LiQpUAr5IO1/6yxlbfPxSFBqrEGEx7Z+PADUmw==
X-Received: by 2002:a17:90b:3505:: with SMTP id
 ls5mr6437623pjb.55.1606338602947; 
 Wed, 25 Nov 2020 13:10:02 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z68sm2599034pgb.37.2020.11.25.13.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 13:10:01 -0800 (PST)
Date: Wed, 25 Nov 2020 13:10:00 -0800
From: Kees Cook <keescook@chromium.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [Intel-wired-lan] [PATCH 000/141] Fix fall-through warnings for
 Clang
Message-ID: <202011251240.1E67BE900@keescook>
References: <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
 <0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com>
 <d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com>
 <dbd2cb703ed9eefa7dde9281ea26ab0f7acc8afe.camel@HansenPartnership.com>
 <20201123130348.GA3119@embeddedor>
 <8f5611bb015e044fa1c0a48147293923c2d904e4.camel@HansenPartnership.com>
 <202011241327.BB28F12F6@keescook>
 <a841536fe65bb33f1c72ce2455a6eb47a0107565.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a841536fe65bb33f1c72ce2455a6eb47a0107565.camel@HansenPartnership.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_161006_225598_0F2647D0 
X-CRM114-Status: GOOD (  16.70  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, bridge@lists.linux-foundation.org,
 target-devel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 linux-iio@vger.kernel.org, samba-technical@lists.samba.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-ide@vger.kernel.org, dm-devel@redhat.com, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, GR-everest-linux-l2@marvell.com,
 wcn36xx@lists.infradead.org, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 linux-scsi@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-rdma@vger.kernel.org, oss-drivers@netronome.com,
 linux-atm-general@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 cluster-devel@redhat.com, usb-storage@lists.one-eyed-alien.net,
 linux-mmc@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 netfilter-devel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-sctp@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 linux-geode@lists.infradead.org, linux-block@vger.kernel.org,
 linux-gpio@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-mediatek@lists.infradead.org, xen-devel@lists.xenproject.org,
 nouveau@lists.freedesktop.org, linux-hams@vger.kernel.org,
 Nathan Chancellor <natechancellor@gmail.com>, linux-can@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-nfs@vger.kernel.org,
 GR-Linux-NIC-Dev@marvell.com, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-decnet-user@lists.sourceforge.net, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-usb@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, x86@kernel.org,
 linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 11:05:35PM -0800, James Bottomley wrote:
> Now, what we have seems to be about 6 cases (at least what's been shown
> in this thread) where a missing break would cause potentially user
> visible issues.  That means the value of this isn't zero, but it's not
> a no-brainer massive win either.  That's why I think asking what we've
> invested vs the return isn't a useless exercise.

The number is much higher[1]. If it were 6 in the entire history of the
kernel, I would agree with you. :) Some were fixed _before_ Gustavo's
effort too, which I also count towards the idea of "this is a dangerous
weakness in C, and now we have stopped it forever."

> But the broader point I'm making is just because the compiler people
> come up with a shiny new warning doesn't necessarily mean the problem
> it's detecting is one that causes us actual problems in the code base. 
> I'd really be happier if we had a theory about what classes of CVE or
> bug we could eliminate before we embrace the next new warning.

But we did! It was long ago justified and documented[2], and even links to
the CWE[3] for it. This wasn't random joy over discovering a new warning
we could turn on, this was turning on a warning that the compiler folks
finally gave us to handle an entire class of flaws. If we need to update
the code-base to address it not a useful debate -- that was settled
already, even if you're only discovering it now. :P. This last patch
set is about finishing that work for Clang, which is correctly even
more strict than GCC.

-Kees

[1] https://outflux.net/slides/2019/lss/kspp.pdf calls out specific
    numbers (about 6.5% of the patches fixed missing breaks):
	v4.19:  3 of 129
	v4.20:  2 of  59
	v5.0:   3 of  56
	v5.1:  10 of 100
	v5.2:   6 of  71
	v5.3:   7 of  69

    And in the history of the kernel, it's been an ongoing source of
    flaws:

    $ l --no-merges | grep -i 'missing break' | wc -l
    185

    The frequency of such errors being "naturally" found was pretty
    steady until the static checkers started warning, and then it was
    on the rise, but the full effort flushed the rest out, and now it's
    dropped to almost zero:

      1 v2.6.12
      3 v2.6.16.28
      1 v2.6.17
      1 v2.6.19
      2 v2.6.21
      1 v2.6.22
      3 v2.6.24
      3 v2.6.29
      1 v2.6.32
      1 v2.6.33
      1 v2.6.35
      4 v2.6.36
      3 v2.6.38
      2 v2.6.39
      7 v3.0
      2 v3.1
      2 v3.2
      2 v3.3
      3 v3.4
      1 v3.5
      8 v3.6
      7 v3.7
      3 v3.8
      6 v3.9
      3 v3.10
      2 v3.11
      5 v3.12
      5 v3.13
      2 v3.14
      4 v3.15
      2 v3.16
      3 v3.17
      2 v3.18
      2 v3.19
      1 v4.0
      2 v4.1
      5 v4.2
      4 v4.5
      5 v4.7
      6 v4.8
      1 v4.9
      3 v4.10
      2 v4.11
      6 v4.12
      3 v4.13
      2 v4.14
      5 v4.15
      2 v4.16
      7 v4.18
      2 v4.19
      6 v4.20
      3 v5.0
     12 v5.1
      3 v5.2
      4 v5.3
      2 v5.4
      1 v5.8


    And the reason it's fully zero, is because we still have the cases we're
    cleaning up right now. Even this last one from v5.8 is specifically of
    the same type this series addresses:

        case 4:
                color_index = TrueCModeIndex;
+               break;
        default:
                return;
        }


[2] https://www.kernel.org/doc/html/latest/process/deprecated.html#implicit-switch-case-fall-through

	All switch/case blocks must end in one of:

	break;
	fallthrough;
	continue;
	goto <label>;
	return [expression];

[3] https://cwe.mitre.org/data/definitions/484.html

-- 
Kees Cook

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
