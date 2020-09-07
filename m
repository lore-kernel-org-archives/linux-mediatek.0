Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE73C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 14:42:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B1EC215A4
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 14:42:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N7a4iVNQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B1EC215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DSkLD+QPWCC/GcldvUpuNv4g+YU+7b5iHbYqa2WXez0=; b=N7a4iVNQSRP2MHqrjk3wyR66U
	65kcl9qch3CjJTCFZPd8Xvpmmmbw0HTvbE/3JrGlN9R7UNG8dV4c3OhNWQxXogt60ZK2jtSYCKLOI
	7ji18+4ORHodjrQoKqN3yzu2lXYw9jSc0cCWIok3O2RF6qz4GMCcH6fJJSfqmt07uWvIRygegTy6Q
	3pMQTdCFzMTyAc3rbYq/+Py/MMZw/+34MiIDGwrmfQiSmqolQuqtWQ3g0nHhpz4couvyDyh3tgNWz
	bIat0L2qEzA09nDeOdX5qMwO1euX11ZZZSxpV9cpNpmVAUEyR9t6hoYEPzvbqonw962XuzDfPr+pV
	ZWmNWYewg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFILS-0008Pb-LB; Mon, 07 Sep 2020 14:42:10 +0000
Received: from jptosegrel01.sonyericsson.com ([124.215.201.71])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFILP-0008Ou-Ow
 for linux-mediatek@lists.infradead.org; Mon, 07 Sep 2020 14:42:09 +0000
Subject: Re: [PATCH v7 3/3] binder: add transaction latency tracer
To: Frankie Chang <Frankie.Chang@mediatek.com>, Todd Kjos <tkjos@google.com>
References: <1596509145.5207.21.camel@mtkswgap22>
 <1596549552-5466-1-git-send-email-Frankie.Chang@mediatek.com>
 <1596549552-5466-4-git-send-email-Frankie.Chang@mediatek.com>
From: peter enderborg <peter.enderborg@sony.com>
Message-ID: <f8ff8cb2-913d-c009-53a4-2918ce923a89@sony.com>
Date: Mon, 7 Sep 2020 16:41:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596549552-5466-4-git-send-email-Frankie.Chang@mediatek.com>
Content-Language: en-GB
X-SEG-SpamProfiler-Analysis: v=2.3 cv=FfdJO626 c=1 sm=1 tr=0
 a=CGteIMthFL3x4Fb36c5kWA==:117 a=IkcTkHD0fZMA:10 a=reM5J-MqmosA:10
 a=9zETfiKQeoRBRZLemOoA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_104207_985289_ACD27F41 
X-CRM114-Status: GOOD (  10.21  )
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
Cc: wsd_upstream@mediatek.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Arve_Hj=c3=b8nnev=c3=a5g?= <arve@android.com>,
 Jian-Min Liu <Jian-Min.Liu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 8/4/20 3:59 PM, Frankie Chang wrote:
> +void probe_binder_txn_latency_free(void *ignore, struct binder_transaction *t,
> +					int from_proc, int from_thread,
> +					int to_proc, int to_thread)
> +{
> +	struct rtc_time tm;
> +	struct timespec64 *startime;
> +	struct timespec64 cur, sub_t;
> +
> +	ktime_get_ts64(&cur);


I think sched_clock is what you want.


> +	startime = &t->timestamp;
> +	sub_t = timespec64_sub(cur, *startime);
> +
> +	/* if transaction time is over than binder_txn_latency_threshold (sec),
> +	 * show timeout warning log.
> +	 */
> +	if (sub_t.tv_sec < binder_txn_latency_threshold)
> +		return;
> +
> +	rtc_time_to_tm(t->tv.tv_sec, &tm);


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
