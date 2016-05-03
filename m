From: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] usb: xhci-mtk: fixup mouse wakeup failure during system suspend
Date: Tue, 03 May 2016 12:33:31 +0300
Message-ID: <87mvo7fpuc.fsf@intel.com>
References: <1461204293-18243-1-git-send-email-chunfeng.yun@mediatek.com> <1462261458.11651.7.camel@mhfsdcap03> <87vb2vfujq.fsf@intel.com> <1462266591.11651.34.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462266591.11651.34.camel@mhfsdcap03>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> writes:
>> chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> writes:
>> > On Thu, 2016-04-21 at 10:04 +0800, Chunfeng Yun wrote:
>> >> Click mouse after xhci suspend completion but before system suspend
>> >> completion, system will not be waken up by mouse if the duration of
>> >> them is larger than 20ms which is the device UFP's resume signaling
>>=20
>> what is "them" here ? The duration of what is longer than 20ms ?
> They are "xhci suspend completion" and "system suspend completion";
>
> It's time duration

okay. So if xhci suspend takes longer than 20ms your SPM doesn't see a
wakeup ?

>> >> lasted. Another reason is that the SPM is not enabled before system
>>=20
>> what's SPM ?
> It is System Power Management which is powered off when system is
> running in normal mode, and is powered on when system enters suspend
> mode. It is used to wakeup system when some wakeup sources, such as
> bluetooth or powerkey etc, tigger wakeup event.

okay, thanks

>> >> suspend compeltion, this causes SPM also not notice the resume signal.
>>            ^^^^^^^^^^
>>            completion
>>=20
>> >> So in order to reduce the duration less than 20ms, make use of
>> >> syscore's suspend/resume interface.
>>=20
>> no, this is the wrong approach
> But it seems only one workable approach from software side

I wouldn't say that. It seems to me SPM should be enabled earlier.

>> >> Because the syscore runs on irq disabled context, and xhci's
>> >> suspend/resume calls some sleeping functions, enable local irq
>> >> and then disable it during suspend/resume. This may be not a problem,
>> >> since only boot CPU is runing.
>>=20
>> another problem :) calling local_irq_{enable,disable}() is an indication
>> that something's wrong.
> Oh!
>
> BTW: There will be warning logs if they are not called.

yeah, I got that :-) But it's still wrong to use
local_irq_{enable,disable}() the way you're using them :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXKHBsAAoJEIaOsuA1yqREvnkP/iV8gMUF9XtNZR7Xe4LYpy/4
vZIEGlYsQojlhJTLLIVQspllAUePKgL7ar1TmFMFtIP3jQ4eOCUqDCPpArD6VRDT
O87ev5hLjQRj2NnzCjvb44tBdzatDT+dR/VmRcV6YlOPVrxhYbwPaG/ym4FwyyCN
Ukcdmlld/kGIMxFOj2ttHqNosx0/Vqp6sASYU6fu1pj36EhOxB9VlSjuaJ4V0Riz
2g1Nzj3tlsJoU/175PJU1oQ60boi04UnAkUSII5pgDrz1bXE9FYaudr8IGpTGf3s
RAQjAA+Bmg9hzOQAxYsx6EBcgZLWYPw0jpKQ3tqlfeWQWePVAvWT3/XXYypN0GyG
c7uu0BBi49fQdnqy9W7zJn3/+dkYb/s6Rh8M9hOK8vDO/pkn0/FEsCesU+3hJtjo
jEhdoNB5mAEKgwuk5jx0h7J8Y5WUydMsusGZHVQL/xeOxZqun2z8ENiP9uzadOFM
huLPdRAYjyGeoGYAcnCpRZjDeOvhbd94gDXnZrUPipp8ea/FIQ+94C0hqflXbNXN
CVm4pXqFEt8xiHD0sHtIC1Cgodn6nZJpvs/l5BB3d88AWEZVFPXPZ3xePW1+1fxy
DraXl3mghG6by0hvCbNJQkpTMOico/jnTIY1DBfFqnsQ+FyPZ0XFy7YKcNqjG2gE
ZY3z006wQzNAwMa746o6
=HQXL
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
