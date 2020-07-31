Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FA8C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 23:17:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D10620791
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 23:17:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tktcn9uN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="cCHWIYgU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D10620791
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:
	References:In-Reply-To:Subject:To:From:Date:Content-Type:MIME-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gBXVgJOhxNwb0l+B52OIaBv4u55eqrAWRBMxMAk3deQ=; b=tktcn9uNDWIiskXvpedUTAho4
	ZQ+mAX1D+LWAPZD8D26hbxT41+bopV5FVlLhpjQdRb+EFAG3W0/vsYoMGeBf2OgKKMFP8d8JL5Eqi
	sTlPLHUSIeMreyq1Imh4gKXB4r6jRR/UDG0vO6AY7TVlvs3yzbr3x0t5+zJaZ02JFPfvlaKOdjJMT
	TAHLricnbNN9ASYVILyNrBFf2or5qG9WYJ5R+DbLneWcU3e4Ybb2BA2pg5e1t4v2r3QOtFULaypvS
	Mwczw3DUd2BrCpiXq8Yo+/lFpFOEsR6yLerzQWUG9Vg+4ISBRDdWxjxLx7XWsLXL/4yspJKAnxgz2
	ALN4wrArQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1eHZ-0000WP-DX; Fri, 31 Jul 2020 23:17:45 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1eHR-0000UF-Lx
 for linux-mediatek@lists.infradead.org; Fri, 31 Jul 2020 23:17:42 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1596237461; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Type: MIME-Version: Sender;
 bh=1zsJhq/goG5jxNbt1w2QIRo86ReaWeQ6QGLznVlr6Jk=;
 b=cCHWIYgUwWCJm9ONhnhJcU/3vqRZTu87AwCGSRNE5UrDb+8BJhsgJul1fFOxBp33PbOL0jU5
 tfHMpPBNdMLvMKrZ5Q8EPQZ5483uK6uyTmg3XHQRARDFAblxBqc/sjv6zptREia/niPsdMZ4
 /4NSfYs3KS3blEx8hfSNOAg+858=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n20.prod.us-west-2.postgun.com with SMTP id
 5f24a676ba6d142d1c91f0e3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 31 Jul 2020 23:17:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 17040C43395; Fri, 31 Jul 2020 23:17:09 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BF5A5C433CA;
 Fri, 31 Jul 2020 23:17:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_5c3e63ea4c7ecc7e8e595b7c9d9d7f3e"
Date: Sat, 01 Aug 2020 07:17:08 +0800
From: Can Guo <cang@codeaurora.org>
To: Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH v4] scsi: ufs: Cleanup completed request without interrupt
 notification
In-Reply-To: <f45c6c47-ffc5-3f8e-3234-9e5989dbf996@acm.org>
References: <20200724140246.19434-1-stanley.chu@mediatek.com>
 <SN6PR04MB4640B5FC06968244DDACB8BEFC720@SN6PR04MB4640.namprd04.prod.outlook.com>
 <1596159018.17247.53.camel@mtkswgap22>
 <97f1dfb0-41b6-0249-3e82-cae480b0efb6@acm.org>
 <8b0a158a7c3ee2165e09290996521ffc@codeaurora.org>
 <f45c6c47-ffc5-3f8e-3234-9e5989dbf996@acm.org>
Message-ID: <548b602daa1e15415625cb8d1f81a208@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_191741_603884_379BDAF7 
X-CRM114-Status: GOOD (  21.44  )
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
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 asutoshd@codeaurora.org, Avri Altman <Avri.Altman@wdc.com>,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 cc.chou@mediatek.com, linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--=_5c3e63ea4c7ecc7e8e595b7c9d9d7f3e
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8;
 format=flowed

Hi Bart,

On 2020-08-01 00:51, Bart Van Assche wrote:
> On 2020-07-31 01:00, Can Guo wrote:
>> AFAIK, sychronization of scsi_done is not a problem here, because scsi
>> layer
>> use the atomic state, namely SCMD_STATE_COMPLETE, of a scsi cmd to 
>> prevent
>> the concurrency of abort and real completion of it.
>> 
>> Check func scsi_times_out(), hope it helps.
>> 
>> enum blk_eh_timer_return scsi_times_out(struct request *req)
>> {
>> ...
>>         if (rtn == BLK_EH_DONE) {
>>                 /*
>>                  * Set the command to complete first in order to 
>> prevent
>> a real
>>                  * completion from releasing the command while error
>> handling
>>                  * is using it. If the command was already completed,
>> then the
>>                  * lower level driver beat the timeout handler, and it
>> is safe
>>                  * to return without escalating error recovery.
>>                  *
>>                  * If timeout handling lost the race to a real
>> completion, the
>>                  * block layer may ignore that due to a fake timeout
>> injection,
>>                  * so return RESET_TIMER to allow error handling 
>> another
>> shot
>>                  * at this command.
>>                  */
>>                 if (test_and_set_bit(SCMD_STATE_COMPLETE, 
>> &scmd->state))
>>                         return BLK_EH_RESET_TIMER;
>>                 if (scsi_abort_command(scmd) != SUCCESS) {
>>                         set_host_byte(scmd, DID_TIME_OUT);
>>                         scsi_eh_scmd_add(scmd);
>>                 }
>>         }
>> }
> 
> I am familiar with this mechanism. My concern is that both the regular
> completion path and the abort handler must call scsi_dma_unmap() before
> calling cmd->scsi_done(cmd). I don't see how
> test_and_set_bit(SCMD_STATE_COMPLETE, &scmd->state) could prevent that
> the regular completion path and the abort handler call scsi_dma_unmap()
> concurrently since both calls happen before the SCMD_STATE_COMPLETE bit
> is set?
> 
> Thanks,
> 
> Bart.

For scsi_dma_unmap() part, that is true - we should make it serialized 
with
any other completion paths. I've found it during my fault injection 
test, so
I've made a patch to fix it, but it only comes in my next error recovery
enhancement patch series. Please check the attachment.

Thanks,

Can Guo.


--=_5c3e63ea4c7ecc7e8e595b7c9d9d7f3e
Content-Transfer-Encoding: base64
Content-Type: text/x-diff;
 name=0005-scsi-ufs-Properly-release-resources-if-a-task-is-abo.patch
Content-Disposition: attachment;
 filename=0005-scsi-ufs-Properly-release-resources-if-a-task-is-abo.patch;
 size=1473

RnJvbSBlZjg3ODMyYjVmNmZmNmFmMjlhYzliYWM3ZmRlYTFlMjQ1YzgxNjJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBDYW4gR3VvIDxjYW5nQGNvZGVhdXJvcmEub3JnPgpEYXRlOiBT
dW4sIDcgSnVuIDIwMjAgMTI6MTY6MDEgKzA4MDAKU3ViamVjdDogW1BBVENIIDUvNl0gc2NzaTog
dWZzOiBQcm9wZXJseSByZWxlYXNlIHJlc291cmNlcyBpZiBhIHRhc2sgaXMKIGFib3J0ZWQgc3Vj
Y2Vzc2Z1bGx5CgpJbiBjdXJyZW50IFVGUyB0YXNrIGFib3J0IGhvb2ssIG5hbWVseSB1ZnNoY2Rf
YWJvcnQoKSwgaWYgYSB0YXNrIGlzCmFib3J0ZWQgc3VjY2Vzc2Z1bGx5LCBjbG9jayBzY2FsaW5n
IGJ1c3kgdGltZSBzdGF0aXN0aWNzIGlzIG5vdCB1cGRhdGVkCmFuZCwgbW9zdCBpbXBvcnRhbnQs
IGNsa19nYXRpbmcuYWN0aXZlX3JlcXMgaXMgbm90IGRlY3JlYXNlZCwgd2hpY2ggbWFrZXMKY2xr
X2dhdGluZy5hY3RpdmVfcmVxcyBzdGF5IGFib3ZlIHplcm8gZm9yZXZlciwgbWVhbmluZyBjbG9j
ayBnYXRpbmcgd291bGQKbmV2ZXIgaGFwcGVuLiBUbyBmaXggaXQsIGluc3RlYWQgb2YgcmVsZWFz
aW5nIHJlc291cmNlcyAibWFubnVhbGx5IiwgdXNlCnRoZSBleGlzdGluZyBmdW5jIF9fdWZzaGNk
X3RyYW5zZmVyX3JlcV9jb21wbCgpLgoKQ2hhbmdlLUlkOiBJYThjYzQ5NmY1M2JiNDI4ZWFjN2Nm
YTc4NGU0MzFhMmIzN2E0NTM3NQpTaWduZWQtb2ZmLWJ5OiBDYW4gR3VvIDxjYW5nQGNvZGVhdXJv
cmEub3JnPgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc2NzaS91ZnMvdWZzaGNkLmMgYi9kcml2ZXJz
L3Njc2kvdWZzL3Vmc2hjZC5jCmluZGV4IDNjNDZmNzQuLjg3YjkxMWYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvc2NzaS91ZnMvdWZzaGNkLmMKKysrIGIvZHJpdmVycy9zY3NpL3Vmcy91ZnNoY2QuYwpA
QCAtNjg3NiwxNiArNjg3NiwxMCBAQCBzdGF0aWMgaW50IHVmc2hjZF9hYm9ydChzdHJ1Y3Qgc2Nz
aV9jbW5kICpjbWQpCiAJCWdvdG8gb3V0OwogCX0KIAotCXNjc2lfZG1hX3VubWFwKGNtZCk7Ci0K
IAlzcGluX2xvY2tfaXJxc2F2ZShob3N0LT5ob3N0X2xvY2ssIGZsYWdzKTsKLQl1ZnNoY2Rfb3V0
c3RhbmRpbmdfcmVxX2NsZWFyKGhiYSwgdGFnKTsKLQloYmEtPmxyYlt0YWddLmNtZCA9IE5VTEw7
CisJX191ZnNoY2RfdHJhbnNmZXJfcmVxX2NvbXBsKGhiYSwgKDFVTCA8PCB0YWcpKTsKIAlzcGlu
X3VubG9ja19pcnFyZXN0b3JlKGhvc3QtPmhvc3RfbG9jaywgZmxhZ3MpOwogCi0JY2xlYXJfYml0
X3VubG9jayh0YWcsICZoYmEtPmxyYl9pbl91c2UpOwotCXdha2VfdXAoJmhiYS0+ZGV2X2NtZC50
YWdfd3EpOwotCiBvdXQ6CiAJaWYgKCFlcnIpIHsKIAkJZXJyID0gU1VDQ0VTUzsKLS0gClF1YWxj
b21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIENvZGUgQXVyb3JhIEZv
cnVtLCBhIExpbnV4IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0LgoK
--=_5c3e63ea4c7ecc7e8e595b7c9d9d7f3e
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--=_5c3e63ea4c7ecc7e8e595b7c9d9d7f3e--

