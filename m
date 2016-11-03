From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH next 1/2] media: mtk-mdp: fix video_device_release
 argument
Date: Thu, 3 Nov 2016 13:47:35 +0100
Message-ID: <dbaa8b70-ea72-7d9b-176c-6c0a816aaae8@xs4all.nl>
References: <1473340146-6598-4-git-send-email-minghsiu.tsai@mediatek.com>
 <20161027202325.20680-1-vincent.stehle@laposte.net>
 <20161028075253.gdy2bbugih6oqncw@romuald.bergerie>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161028075253.gdy2bbugih6oqncw@romuald.bergerie>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Vincent_Stehl=c3=a9?= <vincent.stehle@laposte.net>
Cc: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@s-opensource.com>
List-Id: linux-mediatek@lists.infradead.org

Hi Vincent,

On 28/10/16 09:52, Vincent Stehlé wrote:
> On Thu, Oct 27, 2016 at 10:23:24PM +0200, Vincent Stehlé wrote:
>> video_device_release() takes a pointer to struct video_device as argument.
>> Fix two call sites where the address of the pointer is passed instead.
>
> Sorry, I messed up: please ignore that "fix". The 0day robot made me
> realize this is indeed not a proper fix.
>
> The issue remains, though: we cannot call video_device_release() on the
> vdev structure member, as this will in turn call kfree(). Most probably,
> vdev needs to be dynamically allocated, or the call to
> video_device_release() dropped completely.

I prefer that vdev is dynamically allocated. There are known problems with
embedded video_device structs, so allocating it is preferred.

Minghsiu, can you do that?

Regards,

	Hans

>
> Sorry for the bad patch.
>
> Best regards,
>
> Vincent.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-media" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
